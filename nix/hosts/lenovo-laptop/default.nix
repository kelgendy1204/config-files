{ ... }:

{
    imports = [
        ../../modules/linux
        ./hardware-configuration.nix
    ];

    networking.hostName = "lenovo-laptop";

    system.stateVersion = "25.11";
}
