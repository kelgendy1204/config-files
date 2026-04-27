{ config, pkgs-unstable, ... }:

{
    programs.opencode = {
        enable = true;
        package = pkgs-unstable.opencode;
    };

    xdg.configFile."opencode" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/config-files/config/opencode";
        recursive = false;
    };
}
