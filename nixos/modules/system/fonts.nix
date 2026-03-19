{ pkgs, ... }:

{
    fonts.packages = with pkgs; [
        nerd-fonts.meslo-lg
        nerd-fonts.fira-code
        nerd-fonts.jetbrains-mono
        font-awesome
    ];
}
