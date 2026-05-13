{ ... }:

{
    imports = [
        ./programs/agents.nix
        ./programs/direnv.nix
        ./programs/file-manager.nix
        ./programs/fzf.nix
        ./programs/git.nix
        ./programs/kitty.nix
        ./programs/neovim.nix
        ./programs/npm.nix
        ./programs/opencode.nix
        ./programs/tmux.nix
        ./programs/zsh.nix
    ];

    home.stateVersion = "25.11";
}
