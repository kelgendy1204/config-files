{ config, ... }:

{
    home.file.".npmrc".text = ''
        prefix=${config.home.homeDirectory}/.npm
    '';

    home.sessionPath = [
        "${config.home.homeDirectory}/.npm/bin"
    ];
}
