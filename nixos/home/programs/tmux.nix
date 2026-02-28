{ pkgs, ... }:

{
    programs.tmux = {
        enable = true;

        plugins = with pkgs.tmuxPlugins; [
            {
                plugin = resurrect;
                extraConfig = ''
                     set -g @resurrect-capture-pane-contents 'on'
                '';
            }
            {
                plugin = continuum;
                extraConfig = ''
                    set -g @continuum-save-interval '15'
                    set -g @continuum-restore 'on'
                '';
            }
        ];

        extraConfig = ''
            source-file ../../../config/tmux/tmux.conf
        '';
    };
}
