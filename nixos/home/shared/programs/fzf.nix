{ pkgs, ... }:

{
    # fd and bat are used by fzf for file finding and preview
    home.packages = with pkgs; [
        fd
        bat
    ];

    programs.fzf = {
        enable = true;
        enableZshIntegration = true;

        # Use fd instead of find -- respects .gitignore, faster, hidden files included
        defaultCommand = "fd --type f --hidden --follow --exclude .git";

        # Ctrl+T: file finder
        fileWidgetCommand = "fd --type f --hidden --follow --exclude .git";
        fileWidgetOptions = [
            "--preview 'bat --color=always --style=numbers --line-range=:500 {}'"
        ];

        # Alt+C: directory finder
        changeDirWidgetCommand = "fd --type d --hidden --follow --exclude .git";
        changeDirWidgetOptions = [
            "--preview 'ls -la --color=always {}'"
        ];

        # Ctrl+R: history search
        historyWidgetOptions = [
            "--sort"
            "--exact"
        ];

        # Default appearance
        defaultOptions = [
            "--height 40%"
            "--layout=reverse"
            "--border"
        ];
    };
}
