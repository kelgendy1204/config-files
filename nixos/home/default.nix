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

    home.stateVersion = "25.11";
}
