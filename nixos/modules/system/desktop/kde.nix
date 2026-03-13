{ pkgs, ... }:

{
    services = {
        desktopManager.plasma6.enable = true;
        displayManager.sddm.enable = true;
        displayManager.sddm.wayland.enable = true;
    };

    environment.systemPackages = with pkgs; [
        # KDE Utilities
        kdePackages.discover
        kdePackages.kcalc
        kdePackages.kcharselect
        kdePackages.kclock
        kdePackages.kcolorchooser
        kdePackages.kolourpaint
        kdePackages.ksystemlog
        kdePackages.sddm-kcm
        kdiff3

        # Hardware/System Utilities (Optional)
        kdePackages.isoimagewriter
        kdePackages.partitionmanager
        hardinfo2
        wayland-utils
        wl-clipboard
        vlc
    ];
}
