{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        gnumake
        gcc
        binutils
        tree
        xclip
        tealdeer
        google-chrome
        xed-editor
    ];
}
