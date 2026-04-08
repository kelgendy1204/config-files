{ pkgs, ... }:

{
    # Required for Volta's prebuilt Node binaries on NixOS
    programs.nix-ld.enable = true;

    # Install volta binary
    environment.systemPackages = [ pkgs.volta ];
}
