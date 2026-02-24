{ config, ... }:

{
    programs.npm = {
        enable = true;
        settings = {
            prefix = "${config.home.homeDirectory}/.npm";
        };
    };

    programs.zsh.initContent = ''
        export PATH="${config.home.homeDirectory}/.npm/bin:$PATH"
    '';
}
