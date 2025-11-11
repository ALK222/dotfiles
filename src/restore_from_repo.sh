#!/bin/bash

# === CONFIGURATION ===
json_file="apps.json"
dotfiles_folder="dotfiles"

# === USAGE CHECK ===
if [ $# -ne 1 ]; then
    echo "Usage: $0 [laptop|desktop]"
    exit 1
fi

split_mode="$1"
if [[ "$split_mode" != "laptop" && "$split_mode" != "desktop" ]]; then
    echo "Invalid argument: must be 'laptop' or 'desktop'."
    exit 1
fi

# === FUNCTIONS ===

requires_sudo() {
    local path="$1"
    local dir="$path"
    [ ! -e "$dir" ] && dir="$(dirname "$dir")"
    [ -w "$dir" ] || return 0
    return 1
}

ensure_sudo() {
    if ! sudo -v >/dev/null 2>&1; then
        echo "Elevated permissions required. Please enter your sudo password:"
        sudo -v || { echo "Failed to obtain sudo privileges."; exit 1; }
    fi
}

# Restore single file (handles split configs)
restore_single_file() {
    local app_name="$1"
    local source_path="$2"
    local split_config="$3"
    local app_source="$dotfiles_folder/$app_name"

    local cp_cmd="cp -a"   # <=== changed from cp
    requires_sudo "$source_path" && { ensure_sudo; cp_cmd="sudo cp -a"; }

    if [ -n "$split_config" ]; then
        echo "$split_config" | jq -r '.split_files[]' | while IFS= read -r split_file; do
            local filename
            filename="$(basename "$split_file")"
            local base_name="${filename%.*}"
            local extension="${filename##*.}"
            local split_name="${base_name}-${split_mode}.${extension}"

            local src_file="$app_source/$split_name"
            local dest_dir
            dest_dir="$(dirname "$source_path/$split_file")"
            local dest_file="$source_path/$base_name"

            if [ -f "$src_file" ]; then
                mkdir -p "$dest_dir"
                $cp_cmd "$src_file" "$dest_file"
                echo "Restored: $src_file → $dest_file (removed -$split_mode)"
            else
                echo "Split file not found in dotfiles: $src_file"
            fi
        done
    else
        mkdir -p "$(dirname "$source_path")"
        $cp_cmd "$app_source" "$source_path"
        echo "Restored file: $app_source → $source_path"
    fi
}

# Restore a folder (preserve all attributes)
restore_folder() {
    local app_name="$1"
    local source_path="$2"
    local split_config="$3"
    local app_source="$dotfiles_folder/$app_name"

    if [ ! -d "$app_source" ]; then
        echo "Source folder not found: $app_source"
        return
    fi

    local cp_cmd="cp -a"   # <=== changed from cp -r
    local mv_cmd="mv"
    requires_sudo "$source_path" && { ensure_sudo; cp_cmd="sudo cp -a"; mv_cmd="sudo mv"; }

    mkdir -p "$source_path"
    $cp_cmd "$app_source"/. "$source_path"
    echo "Restored folder: $app_source → $source_path"

    if [ -n "$split_config" ]; then
        echo "$split_config" | jq -r '.split_files[]' | while IFS= read -r split_file; do
            local filename="$split_file"
            local base_name="${filename%.*}"
            local extension="${filename##*.}"
            local split_name="${base_name}-${split_mode}.${extension}"

            local src_file="$source_path/$split_name"
            local dest_file="$source_path/$filename"

            if [ -f "$src_file" ]; then
                $mv_cmd "$src_file" "$dest_file"
                echo "Renamed: $split_name → $split_file (removed -$split_mode)"
            else
                echo "Missing split file in restore source: $src_file"
            fi
        done
    fi
}

# === MAIN SCRIPT ===

if [ ! -f "$json_file" ]; then
    echo "JSON file '$json_file' not found."
    exit 1
fi

if [ ! -d "$dotfiles_folder" ]; then
    echo "Dotfiles folder '$dotfiles_folder' not found."
    exit 1
fi

# Process JSON entries
< "$json_file" jq -c '.configs[]' | while IFS= read -r line; do
    app_name=$(jq -r '.app_name' <<< "$line")
    source_path=$(eval echo "$(jq -r '.source_path' <<< "$line")")
    is_folder=$(jq -r '.is_folder' <<< "$line")
    split_config=$(jq -c '.laptop_desktop_split // empty' <<< "$line")

    if [ -z "$app_name" ] || [ -z "$source_path" ]; then
        echo "Skipping invalid entry: $line"
        continue
    fi

    if [ "$is_folder" == "true" ]; then
        restore_folder "$app_name" "$source_path" "$split_config"
    else
        restore_single_file "$app_name" "$source_path" "$split_config"
    fi
done

echo "✅ All configurations restored from '$dotfiles_folder/' for mode: $split_mode (suffixes removed)."
