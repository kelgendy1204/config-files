{ ... }:

{
    imports = [
        ./programs/zsh.nix
        ./programs/tmux.nix
        ./programs/neovim.nix
        ./programs/kitty.nix
        ./programs/opencode.nix
        ./programs/npm.nix
    ];

    home.username = "khaled";
    home.homeDirectory = "/home/khaled";

    home.stateVersion = "25.11";
}
