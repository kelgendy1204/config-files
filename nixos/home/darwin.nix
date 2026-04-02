{ lib, ... }:

{
    imports = [
        ./programs/zsh.nix
        ./programs/tmux.nix
        ./programs/neovim.nix
        ./programs/kitty.nix
        ./programs/opencode.nix
        ./programs/npm.nix
        ./programs/git.nix
        ./programs/fzf.nix
    ];

    programs.git.settings = {
        user.email = "elgendy1204@gmail.com";
        credential.helper = lib.mkForce "osxkeychain";
    };

    xdg.configFile."kitty/darwin.conf".text = ''
        font_family      ComicShannsMono Nerd Font
    '';

    home.username = "kelgendy";
    home.homeDirectory = "/Users/kelgendy";

    home.stateVersion = "25.11";
}
