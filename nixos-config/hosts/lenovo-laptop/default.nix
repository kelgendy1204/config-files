{ ... }:

{
    imports = [
        ./hardware-configuration.nix

        ../../modules/system/audio.nix
        ../../modules/system/boot.nix
        ../../modules/system/docker.nix
        ../../modules/system/gnome.nix
        ../../modules/system/locale.nix
        ../../modules/system/networking.nix
        ../../modules/system/nix.nix
        ../../modules/system/packages.nix
        ../../modules/system/programs.nix
        ../../modules/system/users.nix
    ];

    networking.hostName = "lenovo-laptop";

    system.stateVersion = "25.11";
}
