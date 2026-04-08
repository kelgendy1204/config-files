{ config, ... }:

{
    programs.zsh.initContent = ''
        export VOLTA_HOME="${config.home.homeDirectory}/.volta"
        export PATH="${config.home.homeDirectory}/.volta/bin:$PATH"
    '';
}
