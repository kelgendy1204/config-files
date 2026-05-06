{ config, ... }:

{
    home.file.".agents" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/config-files/config/agents";
        recursive = false;
    };
}
