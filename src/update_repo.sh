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
    if [ -r "$path" ]; then
        return 1
    else
        return 0
    fi
}

ensure_sudo() {
    if ! sudo -v >/dev/null 2>&1; then
        echo "Elevated permissions required. Please enter your sudo password:"
        sudo -v || { echo "Failed to obtain sudo privileges."; exit 1; }
    fi
}

# Copy single file (with full preservation)
copy_single_file() {
    local app_name="$1"
    local source_path="$2"
    local split_config="$3"
    local destination="$dotfiles_folder/$app_name"
    local cp_cmd="cp -a"   # <=== changed from cp -P

    requires_sudo "$source_path" && { ensure_sudo; cp_cmd="sudo cp -a"; }

    mkdir -p "$(dirname "$destination")"

    if [ -n "$split_config" ]; then
        echo "$split_config" | jq -r '.split_files[]' | while IFS= read -r split_file; do
            local file_path="$source_path/$split_file"
            if [ -f "$file_path" ]; then
                local filename="$(basename "$split_file")"
                local base_name="${filename%.*}"
                local extension="${filename##*.}"
                local new_name="${base_name}-${split_mode}.${extension}"
                mkdir -p "$destination"
                $cp_cmd "$file_path" "$destination/$new_name"
                echo "Copied split file: $file_path → $destination/$new_name"
            else
                echo "Missing split file: $file_path"
            fi
        done
    else
        $cp_cmd "$source_path" "$destination"
        echo "Copied file: $source_path → $destination"
    fi
}

# Copy folder (fully preserve everything)
copy_folder() {
    local app_name="$1"
    local source_path="$2"
    local split_config="$3"
    local destination="$dotfiles_folder/$app_name"
    local cp_cmd="cp -a"   # <=== changed from cp -r

    requires_sudo "$source_path" && { ensure_sudo; cp_cmd="sudo cp -a"; }

    mkdir -p "$destination"
    $cp_cmd "$source_path"/. "$destination"
    echo "Copied folder: $source_path → $destination"

    if [ -n "$split_config" ]; then
        echo "$split_config" | jq -r '.split_files[]' | while IFS= read -r split_file; do
            local original_file="$destination/$split_file"
            if [ -f "$original_file" ]; then
                local filename="$(basename "$split_file")"
                local base_name="${filename%.*}"
                local extension="${filename##*.}"
                local new_name="${base_name}-${split_mode}.${extension}"
                local dest_dir="$(dirname "$original_file")"
                mv "$original_file" "$dest_dir/$new_name"
                echo "Renamed split file: $split_file → $new_name"
            else
                echo "Split file not found after copy: $split_file"
            fi
        done
    fi
}

# === MAIN SCRIPT ===

if [ ! -f "$json_file" ]; then
    echo "JSON file '$json_file' not found."
    exit 1
fi

rm -rf "$dotfiles_folder"
mkdir -p "$dotfiles_folder"

cat "$json_file" | jq -c '.configs[]' | while IFS= read -r line; do
    app_name=$(jq -r '.app_name' <<< "$line")
    source_path=$(eval echo $(jq -r '.source_path' <<< "$line"))
    is_folder=$(jq -r '.is_folder' <<< "$line")
    split_config=$(jq -c '.laptop_desktop_split // empty' <<< "$line")

    if [ -z "$app_name" ] || [ -z "$source_path" ]; then
        echo "Skipping invalid entry: $line"
        continue
    fi

    if [ "$is_folder" == "true" ]; then
        copy_folder "$app_name" "$source_path" "$split_config"
    else
        copy_single_file "$app_name" "$source_path" "$split_config"
    fi
done

echo "All configurations copied to '$dotfiles_folder/' for mode: $split_mode."
