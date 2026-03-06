{ pkgs, ... }:

{
    programs.difftastic.enable = true;
    programs.difftastic.git.enable = true;

    programs.git = {
        enable = true;

        settings = {
            user = {
                name = "Khaled Elgendy";
                email = "elgendy1204@gmail.com";
            };

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
    };
}
