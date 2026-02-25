{ pkgs, lib, ... }:

{
    programs.zsh = {
        enable = true;
        enableCompletion = true;

        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        oh-my-zsh = {
            enable = true;
            plugins = [ "git" "vi-mode" ];
        };

        initContent = lib.mkBefore ''
            source ${../../../config/p10k/p10k.zsh}
            source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme

            commit_push() { git commit -m "$1" && git push; }
            commit_push_no_check() { git commit -m "$1" -n && git push; }

            unzip_tar() {
                if [ -z "$1" ]; then echo "Error: file path is missing."; return 1; fi
                tar zxvf "$1"
            }

            update_branch() {
                local branch="''${1:-main}"
                git checkout "$branch" && git pull && git checkout - && git merge "$branch"
            }

            ssh-add-key() { eval "$(ssh-agent -s)" && ssh-add "$1"; }
        '';

        shellAliases = {
            mynix-switch = "sudo nixos-rebuild switch --flake ~/config-files/nixos#lenovo-laptop";
            mynix-check = "nix flake check ~/config-files/nixos --impure";
            mynix-update = "nix flake update";
            mynix-clean = "nix-collect-garbage -d";

            myip = "curl http://ipecho.net/plain; echo";
            rsync = "rsync -avhP";

            pr_view = "gh pr view --web";
            pr_checks = "gh pr checks";
            pr_diff = "gh pr diff";
            pr_create = "gh pr create --web";
            repo_view = "gh repo view --web";
        };
    };
}
