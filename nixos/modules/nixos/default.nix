{ ... }:

{
    imports = [
        ./audio.nix
        ./boot.nix
        ./desktop
        ./dev
        ./locale.nix
        ./networking.nix
        ./nix.nix
        ./packages.nix
        ./programs.nix
        ./users.nix
        ../shared/fonts.nix
    ];
}
