-- Unity Editor Lag & GTK Accessibility Fixes
hl.env("NO_AT_BRIDGE", "1")
hl.env("GDK_BACKEND", "x11")
hl.env("UNITY_NOPROCUPS", "1")
hl.env("GDK_SCALE", "1")
-- Unity Editor Popup, Focus, and Floating Rules
hl.config({
    windowrulev2 = {
        "noanim, class:^(Unity)$",
        "float, class:^(Unity)$, title:^()$",
        "stayfocused, class:^(Unity)$, title:^()$",
        "float, class:^(Unity)$, title:^(Preferences|Project Settings|Build Settings|Package Manager|UnityEditor.*)$",
        "center, class:^(Unity)$, title:^(Preferences|Project Settings|Build Settings|Package Manager)$",
        "float, class:^(Unity)$, title:^(Unity Launcher|Starting Unity...)$",
        "center, class:^(Unity)$, title:^(Unity Launcher|Starting Unity...)$",
        "suppressevent maximize, class:^(Unity)$",
    },
})
