{ pkgs, lib, config, ... }:

let
    # Catppuccin Mocha color palette
    colors = {
        base = "#1e1e2e";
        mantle = "#181825";
        crust = "#11111b";
        surface0 = "#313244";
        surface1 = "#45475a";
        surface2 = "#585b70";
        overlay0 = "#6c7086";
        overlay1 = "#7f849c";
        text = "#cdd6f4";
        subtext0 = "#a6adc8";
        subtext1 = "#bac2de";
        lavender = "#b4befe";
        blue = "#89b4fa";
        sapphire = "#74c7ec";
        sky = "#89dceb";
        teal = "#94e2d5";
        green = "#a6e3a1";
        yellow = "#f9e2af";
        peach = "#fab387";
        maroon = "#eba0ac";
        red = "#f38ba8";
        mauve = "#cba6f7";
        pink = "#f5c2e7";
        flamingo = "#f2cdcd";
        rosewater = "#f5e0dc";
    };

    modifier = "Mod4"; # Super key
in
{
    home.packages = with pkgs; [
        # Bar
        waybar

        # App launcher
        rofi

        # Notifications
        mako

        # Lock screen
        swaylock-effects

        # Wallpaper
        swaybg

        # Screenshot
        grim        # screenshot tool
        slurp       # region selection
        swappy      # screenshot annotation

        # Brightness & volume
        brightnessctl
        pamixer
        playerctl

        # Idle management
        swayidle

        # File manager
        pcmanfm

        # Image viewer
        imv
    ];

    # GTK theme (Catppuccin)
    gtk = {
        enable = true;
        theme = {
            name = "catppuccin-mocha-blue-standard-dark";
            package = pkgs.catppuccin-gtk.override {
                accents = [ "blue" ];
                variant = "mocha";
            };
        };
        iconTheme = {
            name = "Papirus-Dark";
            package = pkgs.papirus-icon-theme;
        };
        cursorTheme = {
            name = "catppuccin-mocha-dark-cursors";
            package = pkgs.catppuccin-cursors.mochaDark;
            size = 24;
        };
        font = {
            name = "FiraCode Nerd Font";
            size = 11;
        };
    };

    # Cursor theme for Wayland
    home.pointerCursor = {
        name = "catppuccin-mocha-dark-cursors";
        package = pkgs.catppuccin-cursors.mochaDark;
        size = 24;
        gtk.enable = true;
    };

    # ── Sway window manager ──────────────────────────────────────────
    wayland.windowManager.sway = {
        enable = true;
        wrapperFeatures.gtk = true;

        config = {
            inherit modifier;
            terminal = "kitty";
            menu = "rofi -show drun -show-icons";

            # Font
            fonts = {
                names = [ "FiraCode Nerd Font" ];
                size = 11.0;
            };

            # Gaps
            gaps = {
                inner = 8;
                outer = 4;
                smartGaps = true;
            };

            # Window borders
            window = {
                titlebar = false;
                border = 2;
            };

            floating = {
                titlebar = false;
                border = 2;
            };

            # Colors (Catppuccin Mocha)
            colors = {
                focused = {
                    border = colors.lavender;
                    background = colors.base;
                    text = colors.text;
                    indicator = colors.lavender;
                    childBorder = colors.lavender;
                };
                focusedInactive = {
                    border = colors.surface1;
                    background = colors.mantle;
                    text = colors.subtext0;
                    indicator = colors.surface1;
                    childBorder = colors.surface1;
                };
                unfocused = {
                    border = colors.surface0;
                    background = colors.crust;
                    text = colors.overlay0;
                    indicator = colors.surface0;
                    childBorder = colors.surface0;
                };
                urgent = {
                    border = colors.red;
                    background = colors.base;
                    text = colors.red;
                    indicator = colors.red;
                    childBorder = colors.red;
                };
            };

            # Input configuration (touchpad + mouse)
            input = {
                "type:touchpad" = {
                    natural_scroll = "enabled";
                    tap = "enabled";
                    dwt = "enabled";           # disable while typing
                    middle_emulation = "enabled";
                };
                "type:pointer" = {
                    natural_scroll = "enabled";
                };
            };

            # Output (wallpaper)
            output = {
                "*" = {
                    bg = "${colors.crust} solid_color";
                };
            };

            # Status bar
            bars = [{
                command = "waybar";
            }];

            # Keybindings
            keybindings = lib.mkOptionDefault {
                # Launch
                "${modifier}+Return" = "exec kitty";
                "${modifier}+d" = "exec rofi -show drun -show-icons";
                "${modifier}+b" = "exec google-chrome-stable";
                "${modifier}+e" = "exec pcmanfm";

                # Screenshot
                "Print" = "exec grim - | wl-copy";
                "${modifier}+Print" = "exec grim -g \"$(slurp)\" - | wl-copy";
                "${modifier}+Shift+Print" = "exec grim -g \"$(slurp)\" - | swappy -f -";

                # Lock
                "${modifier}+l" = "exec swaylock";

                # Volume
                "XF86AudioRaiseVolume" = "exec pamixer -i 5";
                "XF86AudioLowerVolume" = "exec pamixer -d 5";
                "XF86AudioMute" = "exec pamixer -t";
                "XF86AudioMicMute" = "exec pamixer --default-source -t";

                # Brightness
                "XF86MonBrightnessUp" = "exec brightnessctl set +5%";
                "XF86MonBrightnessDown" = "exec brightnessctl set 5%-";

                # Media
                "XF86AudioPlay" = "exec playerctl play-pause";
                "XF86AudioNext" = "exec playerctl next";
                "XF86AudioPrev" = "exec playerctl previous";

                # Notifications
                "${modifier}+n" = "exec makoctl dismiss";
                "${modifier}+Shift+n" = "exec makoctl dismiss --all";
            };

            # Default workspace assignments
            assigns = {
                "1" = [{ app_id = "kitty"; }];
                "2" = [{ class = "Google-chrome"; }];
            };

            # Startup applications
            startup = [
                {
                    command = ''
                        swayidle -w \
                            timeout 300 'swaylock -f' \
                            timeout 600 'swaymsg "output * power off"' \
                            resume 'swaymsg "output * power on"' \
                            before-sleep 'swaylock -f'
                    '';
                }
            ];
        };

        # Extra config not covered by the module
        extraConfig = ''
            # Floating rules
            for_window [app_id="imv"] floating enable
            for_window [app_id="pavucontrol"] floating enable
            for_window [app_id="pcmanfm"] floating enable
            for_window [title="File Upload"] floating enable
            for_window [title="Save As"] floating enable

            # Smart borders (hide border when only one window)
            smart_borders on
        '';
    };

    # ── Waybar ────────────────────────────────────────────────────────
    xdg.configFile."waybar/config".text = builtins.toJSON {
        layer = "top";
        position = "top";
        height = 36;
        spacing = 4;

        modules-left = [ "sway/workspaces" "sway/mode" "sway/scratchpad" ];
        modules-center = [ "clock" ];
        modules-right = [
            "tray"
            "pulseaudio"
            "network"
            "backlight"
            "battery"
        ];

        clock = {
            format = "  {:%H:%M}";
            format-alt = "  {:%A, %B %d, %Y}";
            tooltip-format = "<tt>{calendar}</tt>";
        };

        battery = {
            states = {
                warning = 30;
                critical = 15;
            };
            format = "{icon}  {capacity}%";
            format-charging = "  {capacity}%";
            format-plugged = "  {capacity}%";
            format-icons = [ "" "" "" "" "" ];
        };

        network = {
            format-wifi = "  {signalStrength}%";
            format-ethernet = "  {ipaddr}";
            format-disconnected = "  Disconnected";
            tooltip-format-wifi = "{essid} ({signalStrength}%)";
        };

        pulseaudio = {
            format = "{icon}  {volume}%";
            format-muted = "  Muted";
            format-icons = {
                default = [ "" "" "" ];
            };
            on-click = "pamixer -t";
            on-click-right = "pavucontrol";
        };

        backlight = {
            format = "{icon}  {percent}%";
            format-icons = [ "" "" "" "" "" "" "" "" "" ];
        };

        tray = {
            spacing = 10;
        };
    };

    xdg.configFile."waybar/style.css".text = ''
        * {
            font-family: "FiraCode Nerd Font", "Font Awesome 6 Free";
            font-size: 14px;
            min-height: 0;
        }

        window#waybar {
            background-color: ${colors.crust};
            color: ${colors.text};
            border-bottom: 2px solid ${colors.surface0};
        }

        #workspaces button {
            padding: 0 8px;
            color: ${colors.overlay0};
            background: transparent;
            border-radius: 6px;
            margin: 4px 2px;
        }

        #workspaces button.focused {
            color: ${colors.base};
            background: ${colors.lavender};
        }

        #workspaces button.urgent {
            color: ${colors.base};
            background: ${colors.red};
        }

        #workspaces button:hover {
            background: ${colors.surface1};
            color: ${colors.text};
        }

        #clock,
        #battery,
        #network,
        #pulseaudio,
        #backlight,
        #tray {
            padding: 0 12px;
            margin: 4px 2px;
            border-radius: 6px;
            background: ${colors.surface0};
            color: ${colors.text};
        }

        #clock {
            color: ${colors.blue};
            font-weight: bold;
        }

        #battery {
            color: ${colors.green};
        }

        #battery.warning {
            color: ${colors.yellow};
        }

        #battery.critical {
            color: ${colors.red};
            animation: blink 1s linear infinite;
        }

        #battery.charging {
            color: ${colors.green};
        }

        #network {
            color: ${colors.sapphire};
        }

        #network.disconnected {
            color: ${colors.overlay0};
        }

        #pulseaudio {
            color: ${colors.mauve};
        }

        #pulseaudio.muted {
            color: ${colors.overlay0};
        }

        #backlight {
            color: ${colors.yellow};
        }

        #tray {
            color: ${colors.text};
        }

        @keyframes blink {
            to { color: ${colors.surface0}; }
        }
    '';

    # ── Mako (notifications) ──────────────────────────────────────────
    services.mako = {
        enable = true;
        settings = {
            font = "FiraCode Nerd Font 11";
            background-color = colors.base;
            text-color = colors.text;
            border-color = colors.lavender;
            border-size = 2;
            border-radius = 8;
            padding = "12";
            margin = "12";
            width = 350;
            default-timeout = 5000;
            group-by = "app-name";

            "urgency=high" = {
                border-color = colors.red;
                default-timeout = 0;
            };
        };
    };

    # ── Swaylock ──────────────────────────────────────────────────────
    xdg.configFile."swaylock/config".text = ''
        daemonize
        show-failed-attempts
        clock
        indicator
        indicator-radius=120
        indicator-thickness=10
        effect-blur=10x5
        effect-vignette=0.5:0.5
        color=${builtins.substring 1 6 colors.base}
        bs-hl-color=${builtins.substring 1 6 colors.red}
        key-hl-color=${builtins.substring 1 6 colors.lavender}
        separator-color=${builtins.substring 1 6 colors.surface0}
        inside-color=${builtins.substring 1 6 colors.base}
        inside-clear-color=${builtins.substring 1 6 colors.base}
        inside-ver-color=${builtins.substring 1 6 colors.base}
        inside-wrong-color=${builtins.substring 1 6 colors.base}
        line-color=00000000
        line-clear-color=00000000
        line-ver-color=00000000
        line-wrong-color=00000000
        ring-color=${builtins.substring 1 6 colors.surface1}
        ring-clear-color=${builtins.substring 1 6 colors.surface1}
        ring-ver-color=${builtins.substring 1 6 colors.blue}
        ring-wrong-color=${builtins.substring 1 6 colors.red}
        text-color=${builtins.substring 1 6 colors.text}
        text-clear-color=${builtins.substring 1 6 colors.text}
        text-ver-color=${builtins.substring 1 6 colors.text}
        text-wrong-color=${builtins.substring 1 6 colors.red}
        font=FiraCode Nerd Font
    '';

    # ── Rofi ──────────────────────────────────────────────────────────
    xdg.configFile."rofi/config.rasi".text = ''
        configuration {
            show-icons: true;
            icon-theme: "Papirus-Dark";
            font: "FiraCode Nerd Font 12";
            display-drun: " Apps";
            display-run: " Run";
            display-window: " Windows";
            drun-display-format: "{name}";
        }

        * {
            bg: ${colors.base};
            bg-alt: ${colors.surface0};
            fg: ${colors.text};
            fg-alt: ${colors.subtext0};
            accent: ${colors.lavender};
            urgent: ${colors.red};

            background-color: transparent;
            text-color: @fg;
        }

        window {
            width: 600px;
            padding: 20px;
            background-color: @bg;
            border: 2px;
            border-color: @accent;
            border-radius: 12px;
        }

        inputbar {
            children: [ prompt, entry ];
            padding: 12px;
            background-color: @bg-alt;
            border-radius: 8px;
            margin: 0 0 10px 0;
        }

        prompt {
            padding: 0 8px 0 0;
            text-color: @accent;
        }

        entry {
            placeholder: "Search...";
            placeholder-color: @fg-alt;
        }

        listview {
            lines: 8;
            columns: 1;
            spacing: 4px;
            fixed-height: true;
        }

        element {
            padding: 10px;
            border-radius: 6px;
        }

        element selected {
            background-color: @accent;
            text-color: @bg;
        }

        element-icon {
            size: 24px;
            margin: 0 10px 0 0;
        }

        element-text {
            vertical-align: 0.5;
        }
    '';
}
