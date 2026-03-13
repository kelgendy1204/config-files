{ ... }:

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

        # DE settings: uncomment one, comment the others
        ./programs/sway-settings.nix
    ];

    home.username = "khaled";
    home.homeDirectory = "/home/khaled";

    home.stateVersion = "25.11";
}
