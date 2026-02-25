{ ... }:

{
    imports = [
        ./hardware-configuration.nix

        ../../modules/system
        ../../modules/dev
    ];

    networking.hostName = "lenovo-laptop";

    system.stateVersion = "25.11";
}
