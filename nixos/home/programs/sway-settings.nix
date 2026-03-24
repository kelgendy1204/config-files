{ pkgs, config, ... }:

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
        swaybg

        # Screenshot
        grim        # screenshot tool
        slurp       # region selection
        swappy      # screenshot annotation

        # Brightness & volume
        brightnessctl
        pamixer
        playerctl

        # Idle management
        swayidle

        # File manager
        pcmanfm

        # Image viewer
        imv

        # Power menu
        wlogout
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

    xdg.configFile."sway" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/config-files/config/sway";
        recursive = false;
    };

    # ── Waybar ────────────────────────────────────────────────────────
    xdg.configFile."waybar" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/config-files/config/waybar";
        recursive = false;
    };

    # ── Mako (notifications) ──────────────────────────────────────────
    services.mako.enable = true;
    xdg.configFile."mako" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/config-files/config/mako";
        recursive = false;
    };

    # ── Swaylock ──────────────────────────────────────────────────────
    xdg.configFile."swaylock" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/config-files/config/swaylock";
        recursive = false;
    };

    # ── Rofi ──────────────────────────────────────────────────────────
    xdg.configFile."rofi" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/config-files/config/rofi";
        recursive = false;
    };

    # ── Wlogout ────────────────────────────────────────────────────────
    xdg.configFile."wlogout" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/config-files/config/wlogout";
        recursive = false;
    };
}
