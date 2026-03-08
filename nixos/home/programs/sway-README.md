# Sway Desktop Environment

Tiling Wayland compositor with Catppuccin Mocha theme, managed declaratively via NixOS + Home Manager.

## Switching to Sway

Two files must be updated — system-level and home-level:

**1. System module** (`modules/system/default.nix`):

```nix
# ./gnome.nix
# ./kde.nix
./sway.nix          # uncomment this, comment the others
```

**2. Home Manager** (`home/lenovo-laptop.nix`):

```nix
# ./programs/gnome-settings.nix
# ./programs/kde-settings.nix
./programs/sway-settings.nix    # uncomment this, comment the others
```

**3. Apply both:**

```sh
mynix-switch     # rebuilds NixOS (system-level: greetd, sway, polkit, etc.)
myhm-switch      # rebuilds Home Manager (user-level: waybar, rofi, mako, etc.)
```

Reboot after the first switch to get greetd as the login manager.

## Architecture

| File | Layer | What it does |
|---|---|---|
| `modules/system/sway.nix` | NixOS | Sway WM, greetd/tuigreet login, XDG portals, polkit, PAM for swaylock, printing |
| `home/programs/sway-settings.nix` | Home Manager | Sway config, Waybar, Rofi, Mako, Swaylock, GTK/cursor theme, packages |
| `modules/system/audio.nix` | NixOS | PipeWire (shared across all DEs, always imported) |

## Theme

**Catppuccin Mocha** applied consistently across all components:

- **GTK**: `Catppuccin-Mocha-Standard-Blue-Dark`
- **Icons**: Papirus-Dark
- **Cursor**: Catppuccin Mocha Dark (24px)
- **Font**: FiraCode Nerd Font (11pt) + Font Awesome for Waybar icons
- **Accent color**: Lavender (`#b4befe`)

## Keybindings

Modifier key is **Super** (Mod4).

### Window Management

These are Sway defaults (inherited via `mkOptionDefault`):

| Key | Action |
|---|---|
| `Super + Enter` | Open terminal (kitty) |
| `Super + Shift + q` | Kill focused window |
| `Super + Arrow` | Move focus |
| `Super + Shift + Arrow` | Move window |
| `Super + 1-9` | Switch to workspace |
| `Super + Shift + 1-9` | Move window to workspace |
| `Super + f` | Toggle fullscreen |
| `Super + Shift + Space` | Toggle floating |
| `Super + v` | Split vertical |
| `Super + h` | Split horizontal |
| `Super + r` | Resize mode (arrows to resize, Enter/Escape to exit) |
| `Super + Shift + c` | Reload Sway config |
| `Super + Shift + e` | Exit Sway |

### Custom Bindings

| Key | Action |
|---|---|
| `Super + d` | App launcher (Rofi) |
| `Super + b` | Browser (Google Chrome) |
| `Super + e` | File manager (PCManFM) |
| `Super + l` | Lock screen (Swaylock) |
| `Super + n` | Dismiss notification |
| `Super + Shift + n` | Dismiss all notifications |
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

## Components

### Waybar (status bar)

Top bar with three sections:

- **Left**: Workspaces, Sway mode, Scratchpad
- **Center**: Clock (click for full date)
- **Right**: System tray, Volume, Network, Backlight, Battery

### Rofi (app launcher)

`Super + d` opens a themed application launcher. Shows .desktop entries with icons.

### Mako (notifications)

Notification daemon with Catppuccin styling. Notifications auto-dismiss after 5 seconds; urgent notifications persist until dismissed manually (`Super + n`).

### Swaylock (lock screen)

Locks on `Super + l` or automatically after 5 minutes idle. Features:
- Blur effect with vignette
- Clock display
- Ring indicator (blue when verifying, red on wrong password)
- Catppuccin Mocha colors

### Swayidle (idle management)

- **5 min**: Lock screen
- **10 min**: Turn off displays
- **Resume**: Turn displays back on
- **Before sleep**: Lock screen

### Input

- **Touchpad**: Natural scroll, tap-to-click, disable-while-typing, middle emulation
- **Mouse**: Natural scroll

## Installed Packages

Managed in `sway-settings.nix` via `home.packages`:

| Package | Purpose |
|---|---|
| waybar | Status bar |
| rofi-wayland | App launcher |
| mako | Notification daemon |
| swaylock-effects | Lock screen (with blur/vignette) |
| swaybg | Wallpaper setter |
| swayidle | Idle management |
| grim | Screenshot capture |
| slurp | Region selection |
| swappy | Screenshot annotation |
| brightnessctl | Backlight control |
| pamixer | PulseAudio/PipeWire mixer CLI |
| playerctl | Media player control |
| pcmanfm | File manager |
| imv | Image viewer |
| font-awesome | Icon font for Waybar |

System-level packages (from `sway.nix`): `wayland-utils`, `wl-clipboard`, `xdg-utils`.

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
- File Upload / Save As dialogs

## Customization

### Wallpaper

Currently set to a solid color (`#11111b` / Catppuccin Crust). To use an image, change the output config in `sway-settings.nix`:

```nix
output = {
    "*" = {
        bg = "/path/to/wallpaper.jpg fill";
    };
};
```

### Colors

All colors are defined in the `colors` attrset at the top of `sway-settings.nix`. Changing these values will propagate to Sway borders, Waybar, Rofi, Mako, and Swaylock.

### Gaps

Default: 8px inner, 4px outer. Smart gaps enabled (gaps disappear with a single window). Edit the `gaps` block in the Sway config section.
