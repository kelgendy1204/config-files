{
    self,
    pkgs,
    ...
}:

{
    environment.systemPackages = with pkgs; [ just ];

    # Necessary for using flakes on this system.
    nix.settings.experimental-features = "nix-command flakes";

    # Determinate uses its own daemon to manage the Nix installation that conflicts with nix-darwin’s native Nix management.
    nix.enable = false;

    # Whether to enable Touch ID with sudo.
    security.pam.services.sudo_local.touchIdAuth = true;

    system.configurationRevision = self.rev or self.dirtyRev or null;
    system.stateVersion = 6;

    # The platform the configuration will be used on.
    nixpkgs.hostPlatform = "aarch64-darwin";
}
