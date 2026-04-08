{ config, ... }:

{
    home.sessionPath = [
        "${config.home.homeDirectory}/.volta/bin"
    ];
}
