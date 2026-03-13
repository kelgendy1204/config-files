{ pkgs, ... }:

{
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
        gnumake
        gcc
        binutils
        tree
        xclip
        tealdeer
        google-chrome
        btop
        nodejs
        gh
    ];
}
