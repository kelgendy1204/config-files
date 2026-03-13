{ pkgs, ... }:

{
    fonts.packages = with pkgs; [
        nerd-fonts.meslo-lg
        nerd-fonts.fira-code
        font-awesome
    ];
}
