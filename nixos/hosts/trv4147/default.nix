{
    self,
    pkgs,
    ...
}:

{
    imports = [
        ../../modules/system/fonts.nix
    ];

    environment.systemPackages = with pkgs; [ just ];

    # Necessary for using flakes on this system.
    nix.settings.experimental-features = "nix-command flakes";

    # Determinate uses its own daemon to manage the Nix installation that conflicts with nix-darwin’s native Nix management.
    nix.enable = false;

    # Whether to enable Touch ID with sudo.
    security.pam.services.sudo_local.touchIdAuth = true;

    users.users.kelgendy = {
        home = "/Users/kelgendy";
    };

    system.configurationRevision = self.rev or self.dirtyRev or null;
    system.stateVersion = 6;

    # ── Homebrew (for macOS-native apps not in nixpkgs) ─────────────
    homebrew = {
        enable = true;
        casks = [
            "menumeters"
        ];
    };

    # The platform the configuration will be used on.
    nixpkgs.hostPlatform = "aarch64-darwin";
}
