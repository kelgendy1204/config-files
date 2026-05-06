{ config, ... }:

{
    home.file.".agents" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/config-files/config/agents";
        recursive = false;
    };

    home.file.".claude/skills" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/config-files/config/agents/skills";
        recursive = false;
    };
}
