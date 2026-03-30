{ config, ... }:

{
    home.file.".npmrc".text = ''
        prefix=${config.home.homeDirectory}/.npm
    '';

    programs.zsh.initContent = ''
        export PATH="${config.home.homeDirectory}/.npm/bin:$PATH"
    '';
}
