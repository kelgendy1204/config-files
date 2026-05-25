{ pkgs, ... }:

{
    # Sway window manager
    programs.sway = {
        enable = true;
        wrapperFeatures.gtk = true;
    };

    # Login manager (greetd with tuigreet for a minimal login screen)
    services.greetd = {
        enable = true;
        settings = {
            default_session = {
                command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --cmd sway";
                user = "greeter";
            };
        };
    };

    # Thunar file manager
    programs.thunar = {
        enable = true;
        plugins = with pkgs; [
            xfce.thunar-volman          # auto-mount removable media
            xfce.thunar-archive-plugin  # right-click extract (works with file-roller)
            xfce.tumbler                # thumbnail previews for images/video
        ];
    };

    # XDG portal for screen sharing, file dialogs, etc.
    xdg.portal = {
        enable = true;
        wlr.enable = true;
        extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };

    # System packages needed for Sway
    environment.systemPackages = with pkgs; [
        wayland-utils
        wl-clipboard
        xdg-utils

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

        # Archive manager
        file-roller

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

    # Enable polkit for authentication dialogs
    security.polkit.enable = true;

    # Allow swaylock to verify passwords
    security.pam.services.swaylock = {};

    # GVfs — trash support, file system mounting, etc.
    services.gvfs.enable = true;

    # Credential storage (gnome-keyring, auto-unlocked at login via PAM)
    services.gnome.gnome-keyring.enable = true;
    security.pam.services.greetd.enableGnomeKeyring = true;
}
