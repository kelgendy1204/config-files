{ pkgs, config, ... }:

let
    # Catppuccin Mocha color palette
    colors = {
        base = "#1e1e2e";
        mantle = "#181825";
        crust = "#11111b";
        surface0 = "#313244";
        surface1 = "#45475a";
        surface2 = "#585b70";
        overlay0 = "#6c7086";
        overlay1 = "#7f849c";
        text = "#cdd6f4";
        subtext0 = "#a6adc8";
        subtext1 = "#bac2de";
        lavender = "#b4befe";
        blue = "#89b4fa";
        sapphire = "#74c7ec";
        sky = "#89dceb";
        teal = "#94e2d5";
        green = "#a6e3a1";
        yellow = "#f9e2af";
        peach = "#fab387";
        maroon = "#eba0ac";
        red = "#f38ba8";
        mauve = "#cba6f7";
        pink = "#f5c2e7";
        flamingo = "#f2cdcd";
        rosewater = "#f5e0dc";
    };

in
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
    services.mako = {
        enable = true;
        settings = {
            font = "JetBrainsMono Nerd Font 11";
            background-color = colors.base;
            text-color = colors.text;
            border-color = colors.lavender;
            border-size = 2;
            border-radius = 8;
            padding = "12";
            margin = "12";
            width = 350;
            default-timeout = 5000;
            group-by = "app-name";

            "urgency=high" = {
                border-color = colors.red;
                default-timeout = 0;
            };
        };
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
