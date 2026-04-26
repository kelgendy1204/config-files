{ pkgs, lib, config, ... }:

{
    home.packages = with pkgs; [
        # Bar
        waybar

        # App launcher
        rofi

        # Notifications
        mako

        # Lock screen
        swaylock-effects

        # Wallpaper
        waypaper
        swaybg # dependency of waypaper

        # Screenshot
        flameshot

        # Brightness & volume
        brightnessctl
        pamixer
        playerctl

        # Idle management
        swayidle

        # Sway autotiling helper
        autotiling

        # File manager
        pcmanfm

        # Image viewer
        imv

        # Video / audio player
        mpv

        # Power menu
        wlogout

        # Volume mixer GUI
        pavucontrol

        # Tray applets
        networkmanagerapplet
        blueman

        # Notifications (notify-send CLI)
        libnotify

        # Display management
        kanshi
        nwg-displays

        # Secret manager GUI
        seahorse

        # Widget system
        eww
    ];

    # GTK theme (Catppuccin)
    gtk = {
        enable = true;
        theme = {
            name = "catppuccin-mocha-blue-standard-dark";
            package = pkgs.catppuccin-gtk.override {
                accents = [ "blue" ];
                variant = "mocha";
            };
        };
        iconTheme = {
            name = "Papirus-Dark";
            package = pkgs.papirus-icon-theme;
        };
        cursorTheme = {
            name = "catppuccin-mocha-dark-cursors";
            package = pkgs.catppuccin-cursors.mochaDark;
            size = 24;
        };
        font = {
            name = "JetBrainsMono Nerd Font";
            size = 11;
        };
    };

    # Cursor theme for Wayland
    home.pointerCursor = {
        name = "catppuccin-mocha-dark-cursors";
        package = pkgs.catppuccin-cursors.mochaDark;
        size = 24;
        gtk.enable = true;
    };

    # ── Sway window manager ──────────────────────────────────────────
    wayland.windowManager.sway = {
        enable = true;
        wrapperFeatures.gtk = true;
        checkConfig = false;
        config = null;
    };

    xdg.configFile."sway/config" = lib.mkForce {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/config-files/config/sway/config";
    };

    # ── Waybar ────────────────────────────────────────────────────────
    xdg.configFile."waybar" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/config-files/config/sway/waybar";
        recursive = false;
    };

    # ── Mako (notifications) ──────────────────────────────────────────
    services.mako.enable = true;
    xdg.configFile."mako" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/config-files/config/sway/mako";
        recursive = false;
    };

    # ── Swaylock ──────────────────────────────────────────────────────
    xdg.configFile."swaylock" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/config-files/config/sway/swaylock";
        recursive = false;
    };

    # ── Rofi ──────────────────────────────────────────────────────────
    xdg.configFile."rofi" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/config-files/config/sway/rofi";
        recursive = false;
    };

    # ── Wlogout ────────────────────────────────────────────────────────
    xdg.configFile."wlogout" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/config-files/config/sway/wlogout";
        recursive = false;
    };

    # ── eww (widget) ──────────────────────────────────────────
    xdg.configFile."eww" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/config-files/config/sway/eww";
        recursive = false;
    };

    # ── Kanshi (display profiles) ─────────────────────────────
    xdg.configFile."kanshi" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/config-files/config/sway/kanshi";
        recursive = false;
    };

    # ── Default applications (XDG MIME) ──────────────────────────────
    # Custom desktop entry: open text files in nvim inside kitty.
    # nvim.desktop has Terminal=true but no terminal specified, so it
    # fails silently. This wrapper makes it explicit.
    xdg.desktopEntries.kitty-nvim = {
        name = "Neovim (Kitty)";
        exec = "kitty nvim %F";
        terminal = false;
        mimeType = [ "text/plain" ];
        noDisplay = true;
    };

    xdg.mimeApps = {
        enable = true;
        defaultApplications = {
            # File manager
            "inode/directory"           = "pcmanfm.desktop";
            "x-scheme-handler/file"     = "pcmanfm.desktop";

            # Text editor
            "text/plain"                = "kitty-nvim.desktop";

            # Browser
            "text/html"                 = "google-chrome.desktop";
            "application/xhtml+xml"     = "google-chrome.desktop";
            "x-scheme-handler/http"     = "google-chrome.desktop";
            "x-scheme-handler/https"    = "google-chrome.desktop";
            "x-scheme-handler/ftp"      = "google-chrome.desktop";
            "x-scheme-handler/about"    = "google-chrome.desktop";
            "x-scheme-handler/unknown"  = "google-chrome.desktop";

            # PDF / documents
            "application/pdf"           = "google-chrome.desktop";

            # Images
            "image/jpeg"                = "imv.desktop";
            "image/png"                 = "imv.desktop";
            "image/gif"                 = "imv.desktop";
            "image/webp"                = "imv.desktop";
            "image/svg+xml"             = "imv.desktop";
            "image/tiff"                = "imv.desktop";
            "image/bmp"                 = "imv.desktop";

            # Video
            "video/mp4"                 = "mpv.desktop";
            "video/mkv"                 = "mpv.desktop";
            "video/webm"                = "mpv.desktop";
            "video/x-matroska"          = "mpv.desktop";
            "video/avi"                 = "mpv.desktop";
            "video/quicktime"           = "mpv.desktop";
            "video/x-msvideo"           = "mpv.desktop";

            # Audio
            "audio/mpeg"                = "mpv.desktop";
            "audio/ogg"                 = "mpv.desktop";
            "audio/flac"                = "mpv.desktop";
            "audio/wav"                 = "mpv.desktop";
            "audio/x-wav"               = "mpv.desktop";
            "audio/aac"                 = "mpv.desktop";
            "audio/opus"                = "mpv.desktop";
        };
    };
}
