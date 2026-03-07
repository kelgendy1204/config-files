{ ... }:

{
    imports = [
        ./audio.nix
        ./boot.nix
        ./gnome.nix     # Desktop: swap with ./kde.nix to switch
        # ./kde.nix
        ./locale.nix
        ./networking.nix
        ./nix.nix
        ./packages.nix
        ./programs.nix
        ./users.nix
    ];
}
