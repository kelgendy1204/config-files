import { App, Gtk, Gdk } from "astal/gtk3";
import { Variable } from "astal";

const sections = [
    {
        label: "Launch",
        color: "peach",
        binds: [
            { desc: "Terminal (foot)", keys: ["$mod", "Return"] },
            { desc: "App launcher (wofi)", keys: ["$mod", "d"] },
            { desc: "File manager (nemo)", keys: ["$mod", "e"] },
            { desc: "Browser (firefox)", keys: ["$mod", "b"] },
            { desc: "Screenshot (grimblast)", keys: ["Print"] },
            { desc: "Color picker (hyprpicker)", keys: ["$mod", "Alt", "p"] },
        ],
    },
    {
        label: "Windows",
        color: "blue",
        binds: [
            { desc: "Focus direction", keys: ["$mod", "hjkl"] },
            { desc: "Move window", keys: ["$mod", "Shift", "hjkl"] },
            { desc: "Kill focused window", keys: ["$mod", "Shift", "q"] },
            { desc: "Toggle floating", keys: ["$mod", "Shift", "Space"] },
            { desc: "Toggle fullscreen", keys: ["$mod", "f"] },
            { desc: "Toggle sticky", keys: ["$mod", "Shift", "s"] },
        ],
    },
    {
        label: "Layout",
        color: "mauve",
        binds: [
            { desc: "Split horizontal", keys: ["$mod", "h"] },
            { desc: "Split vertical", keys: ["$mod", "v"] },
            { desc: "Stacking layout", keys: ["$mod", "s"] },
            { desc: "Tabbed layout", keys: ["$mod", "w"] },
            { desc: "Tiling layout", keys: ["$mod", "t"] },
            { desc: "Resize mode", keys: ["$mod", "r"] },
        ],
    },
    {
        label: "Workspaces",
        color: "yellow",
        binds: [
            { desc: "Go to workspace N", keys: ["$mod", "1–9"] },
            { desc: "Move window to WS N", keys: ["$mod", "Shift", "1–9"] },
            { desc: "Next workspace", keys: ["$mod", "Tab"] },
            { desc: "Prev workspace", keys: ["$mod", "Shift", "Tab"] },
            { desc: "Back and forth", keys: ["$mod", "\\"] },
            { desc: "Scratchpad show", keys: ["$mod", "Shift", "minus"] },
        ],
    },
    {
        label: "Media & Audio",
        color: "teal",
        binds: [
            { desc: "Volume up", keys: ["XF86VolUp"] },
            { desc: "Volume down", keys: ["XF86VolDn"] },
            { desc: "Mute toggle", keys: ["XF86Mute"] },
            { desc: "Mic mute", keys: ["XF86MicMute"] },
            { desc: "Play / Pause", keys: ["XF86Play"] },
            { desc: "Next / Prev track", keys: ["XF86Next / Prev"] },
        ],
    },
    {
        label: "System",
        color: "red",
        binds: [
            { desc: "Reload config", keys: ["$mod", "Shift", "c"] },
            { desc: "Restart Sway", keys: ["$mod", "Shift", "r"] },
            { desc: "Exit Sway", keys: ["$mod", "Shift", "e"] },
            { desc: "Lock screen (swaylock)", keys: ["$mod", "l"] },
            { desc: "Brightness up", keys: ["XF86MonUp"] },
            { desc: "Brightness down", keys: ["XF86MonDn"] },
        ],
    },
];

function Key({ label, isMod }: { label: string; isMod: boolean }) {
    return <label className={`key ${isMod ? "key-mod" : ""}`} label={label} />;
}

function KeyRow({ desc, keys }: { desc: string; keys: string[] }) {
    const modKeys = ["$mod", "Shift", "Alt", "Ctrl"];
    return (
        <box className="keybind-row" hexpand>
            <label
                className="keybind-desc"
                label={desc}
                hexpand
                xalign={0}
                truncate
            />
            <box className="keys" spacing={2}>
                {keys.map((k, i) => (
                    <box>
                        {i > 0 && <label className="key-plus" label="+" />}
                        <Key label={k} isMod={modKeys.includes(k)} />
                    </box>
                ))}
            </box>
        </box>
    );
}

function Section({
    label,
    color,
    binds,
}: {
        label: string;
        color: string;
        binds: { desc: string; keys: string[] }[];
    }) {
    return (
        <box className="section" vertical>
            <box className="section-header" spacing={8}>
                <box className={`section-dot dot-${color}`} />
                <label className={`section-label label-${color}`} label={label} />
                <box className="section-line" hexpand />
            </box>
            {binds.map((b) => (
                <KeyRow desc={b.desc} keys={b.keys} />
            ))}
        </box>
    );
}

export default function Keybindings() {
    return (
        <window
            name="keybindings"
            className="keybindings-window"
            layer={Gtk.LayerShell.Layer.BOTTOM}
            anchor={
                Gtk.LayerShell.Edge.LEFT |
                    Gtk.LayerShell.Edge.TOP |
                    Gtk.LayerShell.Edge.BOTTOM
            }
            exclusivity={Gtk.LayerShell.Exclusivity.IGNORE}
            keymode={Gtk.LayerShell.KeyboardMode.NONE}
            visible
        >
            <box className="widget" vertical>
                {/* Header */}
                <box className="header" vertical>
                    <box className="header-top">
                        <label
                            className="header-title"
                            label="⌨  Keybindings"
                            xalign={0}
                            hexpand
                        />
                        <label className="header-icon" label="⌘" />
                    </box>
                    <label
                        className="header-sub"
                        label="Sway WM · $mod = Super"
                        xalign={0}
                    />
                </box>

                {/* Scrollable content */}
                <scrollable
                    className="scroll-area"
                    vscroll={Gtk.PolicyType.AUTOMATIC}
                    hscroll={Gtk.PolicyType.NEVER}
                    vexpand
                >
                    <box vertical>
                        {sections.map((s) => (
                            <Section label={s.label} color={s.color} binds={s.binds} />
                        ))}
                    </box>
                </scrollable>

                {/* Footer */}
                <box className="footer" spacing={8}>
                    <box className="status-dot" />
                    <label
                        className="footer-text"
                        label="Sway WM active"
                        hexpand
                        xalign={0}
                    />
                    <label className="footer-tag" label="ags widget" />
                </box>
            </box>
        </window>
    );
}
