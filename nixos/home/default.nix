{ ... }:

{
    imports = [
        ./programs/zsh.nix
        ./programs/tmux.nix
        ./programs/neovim.nix
        ./programs/kitty.nix
        ./programs/opencode.nix
        ./programs/npm.nix
        ./programs/volta.nix
        ./programs/git.nix
        ./programs/fzf.nix

        # DE settings
        ./programs/sway-settings.nix
    ];

    home.username = "khaled";
    home.homeDirectory = "/home/khaled";

    home.stateVersion = "25.11";
}
