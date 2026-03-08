{ ... }:

{
    imports = [
        ./audio.nix
        ./boot.nix
        # ./gnome.nix     # Desktop: uncomment one DE, comment the others
        # ./kde.nix
        ./sway.nix
        ./locale.nix
        ./networking.nix
        ./nix.nix
        ./packages.nix
        ./programs.nix
        ./users.nix
    ];
}
