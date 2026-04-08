{ ... }:

{
    imports = [
        ./hardware-configuration.nix
        ../../modules/nixos
    ];

    networking.hostName = "lenovo-laptop";

    system.stateVersion = "25.11";
}
