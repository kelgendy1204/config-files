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

    # XDG portal for screen sharing, file dialogs, etc.
    xdg.portal = {
        enable = true;
        wlr.enable = true;
        extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };

    services.printing.enable = true;

    # System packages needed for Sway
    environment.systemPackages = with pkgs; [
        wayland-utils
        wl-clipboard
        xdg-utils
    ];

    # Enable polkit for authentication dialogs
    security.polkit.enable = true;

    # Allow swaylock to verify passwords
    security.pam.services.swaylock = {};
}
