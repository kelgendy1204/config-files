{ pkgs, ... }:

{
    programs.git = {
        enable = true;

        userName = "Khaled Elgendy";
        userEmail = "elgendy1204@gmail.com";

        extraConfig = {
            push = {
                default = "simple";
                autoSetupRemote = true;
            };

            core = {
                autocrlf = "input";
            };

            color = {
                ui = true;
            };

            init = {
                defaultBranch = "main";
            };

            merge = {
                conflictstyle = "merge";
            };

            # Modern improvements
            diff = {
                algorithm = "histogram";
                colorMoved = "default";
            };

            fetch = {
                prunetags = true;
            };

            branch = {
                sort = "-committerdate";
            };

            tag = {
                sort = "-version:refname";
            };

            column = {
                ui = "auto";
            };
        };

        # Use difftastic as a difftool instead of diff.external
        # diff.external breaks interactive commands like 'git add -p'
        # Use with: git difftool
        difftastic = {
            enable = true;
        };
    };
}
