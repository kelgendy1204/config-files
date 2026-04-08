{ lib, ... }:

{
    imports = [
        ./default.nix
    ];

    programs.zsh.initContent = ''
        eval "$(/opt/homebrew/bin/brew shellenv zsh)"
    '';

    programs.git.settings = {
        user.email = "elgendy1204@gmail.com";
        credential.helper = lib.mkForce "osxkeychain";
    };

    xdg.configFile."kitty/darwin.conf".text = ''
        font_family      ComicShannsMono Nerd Font
    '';
}
