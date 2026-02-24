{ config, pkgs, ... }:

{
    programs.kitty.enable = true;

    xdg.configFile."kitty" = {
        source = ./../config-files/kitty;
        recursive = true;
    };
}
