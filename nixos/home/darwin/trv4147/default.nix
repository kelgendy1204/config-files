{ lib, ... }:

{
    imports = [
        ../../shared
    ];

    programs.git.settings = {
        user.email = lib.mkForce "elgendy1204@outlook.com";
        credential.helper = lib.mkForce "osxkeychain";
    };

    xdg.configFile."kitty/darwin.conf".text = ''
        font_family      ComicShannsMono Nerd Font
    '';
}
