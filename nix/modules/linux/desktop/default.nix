{ ... }:

{
    imports = [
        # Desktop: uncomment one DE, comment the others
        # ./gnome.nix
        # ./kde.nix
        ./sway.nix
    ];

    services.printing.enable = true;
}
