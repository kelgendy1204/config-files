# Sway Desktop Environment

Tiling Wayland compositor with Catppuccin Mocha theme, managed declaratively via NixOS + Home Manager.

## Switching to Sway

Two files must be updated — system-level and home-level:

**1. System module** (`modules/system/desktop/default.nix`):

```nix
# ./gnome.nix
# ./kde.nix
./sway.nix          # uncomment this, comment the others
```

**2. Home Manager** (`home/default.nix`):

```nix
# ./programs/gnome-settings.nix
# ./programs/kde-settings.nix
./programs/sway-settings.nix    # uncomment this, comment the others
```

**3. Apply:**

```sh
mynix-switch     # rebuilds NixOS + Home Manager (system + user level)
```

Reboot after the first switch to get greetd as the login manager.

## Architecture

| File | Layer | What it does |
|---|---|---|
| `modules/system/desktop/sway.nix` | NixOS | Sway WM, greetd/tuigreet login, XDG portals, polkit, PAM for swaylock, gnome-keyring |
| `modules/system/desktop/default.nix` | NixOS | DE selector (imports active DE), printing |
| `modules/system/fonts.nix` | NixOS | All fonts (Nerd Fonts, Font Awesome) |
| `home/programs/sway-settings.nix` | Home Manager | Sway config, Waybar, Rofi, Mako, Swaylock, GTK/cursor theme, packages |
| `modules/system/audio.nix` | NixOS | PipeWire (shared across all DEs, always imported) |

## Theme

**Catppuccin Mocha** applied consistently across all components:

- **GTK**: `catppuccin-mocha-blue-standard-dark`
- **Icons**: Papirus-Dark
- **Cursor**: Catppuccin Mocha Dark (24px)
- **Font**: JetBrains Mono Nerd Font (11pt) + Font Awesome for Waybar icons
- **Accent color**: Lavender (`#b4befe`)

## Keybindings

Modifier key is **Super** (Mod4). The sway config is a standalone file at `config/sway/config` — keybindings are defined explicitly (not via Home Manager `mkOptionDefault`). The `include /etc/sway/config.d/*` line only pulls in NixOS D-Bus/systemd integration, not default keybindings.

### Basics

| Key | Action |
|---|---|
| `Super + Return` | Open terminal (kitty) |
| `Super + q` | Kill focused window |
| `Super + d` | App launcher (Rofi) |
| `Super + b` | Browser (Google Chrome) |
| `Super + e` | File manager (PCManFM) |
| `Super + Shift + c` | Reload Sway config |
| `Super + hold + mouse` | Drag (left-click) / resize (right-click) floating windows |

### Lock / Power

| Key | Action |
|---|---|
| `Super + Escape` | Lock screen (Swaylock) |
| `Super + Shift + Escape` | Power menu (Wlogout) |

### Focus Navigation

| Key | Action |
|---|---|
| `Super + h/j/k/l` | Focus left/down/up/right (vim-style) |
| `Super + Arrow` | Focus left/down/up/right (arrows) |

### Move Window

| Key | Action |
|---|---|
| `Super + Shift + h/j/k/l` | Move window left/down/up/right (vim-style) |
| `Super + Shift + Arrow` | Move window left/down/up/right (arrows) |

### Workspaces

| Key | Action |
|---|---|
| `Super + 1-9, 0` | Switch to workspace 1-10 |
| `Super + Shift + 1-9, 0` | Move window to workspace 1-10 |

### Window Layout

| Key | Action |
|---|---|
| `Super + f` | Toggle fullscreen |
| `Super + Shift + Space` | Toggle floating |
| `Super + Space` | Toggle focus between tiling/floating |
| `Super + a` | Focus parent container |

### Scratchpad

| Key | Action |
|---|---|
| `Super + grave` (backtick) | Show / cycle scratchpad |
| `Super + Shift + grave` | Move window to scratchpad |

### Modes

Sway modes are mini-keymaps: press the mode entry key, then a key inside the mode. The mode exits automatically after the action (or press Escape/Return to cancel).

#### Split Mode (`Super + s`)

| Key (inside mode) | Action |
|---|---|
| `-` | Split horizontal |
| `Shift + \` (`\|`) | Split vertical |
| `Escape` / `Return` | Cancel |

#### Layout Mode (`Super + ,`)

| Key (inside mode) | Action |
|---|---|
| `t` | Layout tabbed |
| `s` | Layout stacking |
| `Escape` / `Return` | Cancel |

#### Resize Mode (`Super + r`)

| Key (inside mode) | Action |
|---|---|
| `h` / `Left` | Shrink width 10px |
| `l` / `Right` | Grow width 10px |
| `k` / `Up` | Shrink height 10px |
| `j` / `Down` | Grow height 10px |
| `Escape` / `Return` | Exit |

### Screenshot

| Key | Action |
|---|---|
| `Print` | Screenshot (full screen to clipboard) |
| `Super + Print` | Screenshot (select region to clipboard) |
| `Super + Shift + Print` | Screenshot (select region, open in Swappy for annotation) |

### Media / Hardware Keys

| Key | Action |
|---|---|
| `Volume Up/Down` | Adjust volume (5% steps via pamixer) |
| `Volume Mute` | Toggle mute |
| `Mic Mute` | Toggle mic mute |
| `Brightness Up/Down` | Adjust brightness (5% steps via brightnessctl) |
| `Play/Pause` | playerctl play-pause |
| `Next/Prev` | playerctl next/previous |

### Notifications

| Key | Action |
|---|---|
| `Super + n` | Dismiss notification |
| `Super + Shift + n` | Dismiss all notifications |

## Components

### Waybar (status bar)

Top bar with three sections:

- **Left**: Workspaces, Sway mode, Scratchpad
- **Center**: Active window title
- **Right**: CPU, Memory, Bandwidth, Tray, Volume, Network, Backlight, Battery, Clock, Language, Privacy

### Wlogout (power menu)

`Super + Shift + Escape` opens a full-screen power menu with six actions: Lock, Logout, Suspend, Hibernate, Reboot, Shutdown. Each button is color-coded with a Catppuccin accent and fills in on hover. Configuration lives at `~/.config/wlogout/style.css`.

### Rofi (app launcher)

`Super + d` opens a themed application launcher. Shows .desktop entries with icons.

### Mako (notifications)

Notification daemon with Catppuccin styling. Notifications auto-dismiss after 5 seconds; urgent notifications persist until dismissed manually (`Super + n`).

### Swaylock (lock screen)

Locks on `Super + Escape` or automatically after 5 minutes idle. Features:
- Blur effect with vignette
- Clock display
- Ring indicator (blue when verifying, red on wrong password)
- Catppuccin Mocha colors

### Swayidle (idle management)

- **5 min**: Lock screen
- **10 min**: Turn off displays
- **Resume**: Turn displays back on
- **Before sleep**: Lock screen

### Credential Storage (gnome-keyring)

gnome-keyring provides a D-Bus secret service for apps to store/retrieve credentials. Configured in `sway.nix` at the system level:

- Auto-unlocks at login via PAM integration with greetd (no manual interaction needed)
- Used by Chrome, Firefox, `gh`, and git (via `libsecret` credential helper) transparently
- Use `seahorse` to visually inspect stored secrets if needed

### Tray Applets

Started automatically via the sway config:

- **nm-applet**: NetworkManager tray icon for WiFi management
- **blueman-applet**: Bluetooth tray icon and management

### Display Management

- **kanshi**: Auto-detect and configure displays when plugging/unplugging external monitors. Configured via `~/.config/kanshi/config`.
- **wdisplays**: GUI tool for display arrangement. Launch from Rofi when needed.

### Input

- **Touchpad**: Natural scroll, tap-to-click, disable-while-typing, middle emulation
- **Mouse**: Natural scroll

## Installed Packages

### Home Manager (`sway-settings.nix`)

| Package | Purpose |
|---|---|
| waybar | Status bar |
| rofi | App launcher |
| mako | Notification daemon |
| swaylock-effects | Lock screen (with blur/vignette) |
| swaybg | Wallpaper setter (used internally by sway's `output bg` directive) |
| swayidle | Idle management |
| grim | Screenshot capture |
| slurp | Region selection for screenshots |
| swappy | Screenshot annotation |
| brightnessctl | Backlight control |
| pamixer | PulseAudio/PipeWire volume CLI |
| playerctl | Media player control (play/pause/next/prev) |
| wlogout | Power menu (lock/logout/suspend/reboot/shutdown) |
| pcmanfm | File manager |
| imv | Image viewer |
| pavucontrol | Volume mixer GUI (right-click volume in Waybar) |
| networkmanagerapplet | WiFi tray applet (nm-applet) |
| blueman | Bluetooth tray applet |
| libnotify | `notify-send` CLI (used by apps/scripts to send notifications to mako) |
| kanshi | Auto display configuration for external monitors |
| wdisplays | GUI display configuration tool |
| seahorse | GUI to inspect gnome-keyring secrets |

### System-level (`sway.nix`)

| Package | Purpose |
|---|---|
| wayland-utils | Wayland diagnostic tool (`wayland-info`) |
| wl-clipboard | `wl-copy` / `wl-paste` for clipboard |
| xdg-utils | `xdg-open` and friends (used by apps to open URLs/files) |

Fonts (from `modules/system/fonts.nix`): `nerd-fonts.meslo-lg`, `nerd-fonts.fira-code`, `nerd-fonts.jetbrains-mono`, `font-awesome`.

## Workspace Assignments

| Workspace | Auto-assigned apps |
|---|---|
| 1 | kitty |
| 2 | Google Chrome |

## Floating Window Rules

These windows open floating by default:

- `imv` (image viewer)
- `pavucontrol` (audio settings)
- `pcmanfm` (file manager)
- `wlogout` (power menu)
- `blueman-manager` (Bluetooth settings)
- `wdisplays` (display configuration)
- `seahorse` (secret manager)
- File Upload / Save As dialogs

## Customization

### Wallpaper

Currently set to `~/Pictures/wallpaper-1.jpg`. To change, edit the `output` line in `config/sway/config`:

```
output * bg ~/Pictures/your-wallpaper.jpg fill
```

Scale modes: `fill`, `fit`, `stretch`, `center`, `tile`.

To change the wallpaper at runtime without editing the config:

```sh
swaymsg output '*' bg /path/to/wallpaper.jpg fill
```

### Colors

All colors are defined in the `client.*` directives in `config/sway/config`. Changing these values will update Sway's window borders. Other components (Waybar, Rofi, Mako, Swaylock) have their own Catppuccin configs in their respective config directories under `config/sway/`.

### Gaps

Default: 8px inner, 4px outer. Smart gaps enabled (gaps disappear with a single window). Edit the `gaps` lines in `config/sway/config`.
