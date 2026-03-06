{ pkgs, ... }:

{
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

            diff = {
                algorithm = "histogram";
                colorMoved = "default";
            };

            fetch = {
                pruneTags = true;
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
