{ pkgs, ... }:

{
    programs.tmux = {
        enable = true;

        prefix = "C-a";
        terminal = "screen-256color";
        historyLimit = 10000;
        baseIndex = 1;
        escapeTime = 0;
        keyMode = "vi";
        mouse = true;

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
            {
                plugin = tmux-fzf;
            }
        ];

        extraConfig = ''
            set -g pane-base-index 1
            set -g renumber-windows on
            setw -g allow-rename off

            unbind-key C-b
            bind-key a send-prefix

            bind-key P run-shell "xclip -o | tmux load-buffer - && tmux paste-buffer"
            bind-key C-p choose-buffer
            bind-key -T copy-mode-vi v send-keys -X begin-selection
            bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
            bind-key -T copy-mode-vi y send-keys -X copy-selection
            bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'xclip -in -selection clipboard'

            bind-key b break-pane -d
            bind-key t choose-tree
            bind -n C-k clear-history
            bind C-c new-session

            bind h select-pane -L
            bind j select-pane -D
            bind k select-pane -U
            bind l select-pane -R

            bind-key -r C-k resize-pane -U 5
            bind-key -r C-j resize-pane -D 5
            bind-key -r C-h resize-pane -L 5
            bind-key -r C-l resize-pane -R 5

            bind -n M-Left select-pane -L
            bind -n M-Right select-pane -R
            bind -n M-Up select-pane -U
            bind -n M-Down select-pane -D

            bind -n S-Left previous-window
            bind -n S-Right next-window

            bind | split-window -h -c '#{pane_current_path}'
            bind - split-window -v -c '#{pane_current_path}'
            unbind '"'
            unbind %

            bind-key c new-window -c '#{pane_current_path}'
            bind-key m set-option -g mouse \; display "Mouse: #{?mouse,ON,OFF}"

            set -g status-position bottom
            set -g status-justify left
            set -g status-keys vi
            set -g status-interval 1
            set -g status-right '#{?client_prefix,   ,} #(/bin/sh ~/config-files/scripts/netspeed.sh) | #(/bin/sh ~/config-files/scripts/cpu.sh) | #(/bin/sh ~/config-files/scripts/mem.sh) | %r - %a %d-%b-%Y '
            set -g status-bg black
            set -g status-fg white
            set -g status-right-length 150
            set -g status-left-length 30
            set -g status-left ' #[fg=green,bold,dim]#S '

            set-window-option -g window-status-current-style fg=white,bg=colour8
            set-window-option -g window-status-style fg=white,bg=black
            set-window-option -g window-status-activity-style fg=yellow,none,bg=black
            set-window-option -g window-status-current-format ' #I:#W#{?window_zoomed_flag, 🔍 ,} '
            set-window-option -g window-status-format '#I:#W#{?window_zoomed_flag, 🔍 ,}'

            set -g set-titles on
            set -g set-titles-string '#(whoami)@#H : #S(#I:#W)'

            set-option -g display-time 4000
            set-window-option -g xterm-keys on
            setw -g aggressive-resize on
        '';
    };
}
