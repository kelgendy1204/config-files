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
        wdisplays

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
}
