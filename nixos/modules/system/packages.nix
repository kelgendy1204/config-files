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
        nerd-fonts.meslo-lg
        nerd-fonts.fira-code
        nodejs
        gh
    ];
}
