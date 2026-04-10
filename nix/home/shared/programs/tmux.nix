{ pkgs, config, lib, ... }:

{
    # Scripts in tmux status bar depend on these Linux-only tools
    home.packages = lib.optionals pkgs.stdenv.isLinux (with pkgs; [
        iproute2  # netspeed.sh: ip route get
        procps    # mem.sh: free --mega
    ]);

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
            source-file ${config.home.homeDirectory}/config-files/config/tmux/tmux.conf
        '';
    };
}
