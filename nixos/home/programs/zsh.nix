{ pkgs, lib, ... }:

{
    home.sessionVariables = {
        EDITOR = "nvim";
    };

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

            # Attach or create tmux session named after current directory
            tat() {
                local session_name
                session_name="$(basename "$PWD" | tr . -)"

                if [ -z "$TMUX" ]; then
                    tmux new-session -As "$session_name"
                else
                    if ! tmux list-sessions -F '#S' | grep -q "^''${session_name}$"; then
                        TMUX="" tmux new-session -Ad -s "$session_name"
                    fi
                    tmux switch-client -t "$session_name"
                fi
            }

            # In tmux: clear also clears scrollback history
            if [[ -n "$TMUX" ]]; then
                alias clear='clear && tmux clear-history'
            fi

            # Clean old NixOS generations, garbage collect, and update boot menu
            mynix-clean() {
                sudo nix-env --delete-generations +5 --profile /nix/var/nix/profiles/system \
                && nix-collect-garbage -d \
                && sudo nixos-rebuild boot --flake ~/config-files/nixos#lenovo-laptop
            }

            # Auto-start tmux on shell launch
            if [ -z "$TMUX" ]; then
                tat
            fi
        '';

        shellAliases = {
            # Home Manager
            myhm-switch = "home-manager switch --flake ~/config-files/nixos";
            myhm-generations = "home-manager generations";
            myhm-packages = "home-manager packages";
            myhm-rollback = "home-manager switch --rollback";

            # NixOS
            mynix-switch = "sudo nixos-rebuild switch --flake ~/config-files/nixos#lenovo-laptop";
            mynix-check = "nix flake check ~/config-files/nixos --impure";
            mynix-update = "nix flake update --flake ~/config-files/nixos";
            mynix-generations = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system";
            mynix-rollback = "sudo nixos-rebuild switch --rollback";

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
