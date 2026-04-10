{ ... }:

{
    imports = [
        ./hardware-configuration.nix
        ../../modules/linux
    ];

    networking.hostName = "lenovo-laptop";

    system.stateVersion = "25.11";
}
