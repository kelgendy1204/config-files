{ config, ... }:

{
    programs.opencode = {
        enable = true;
    };

    xdg.configFile."opencode" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/config-files/config/opencode";
        recursive = false;
    };
}
