{ ... }:

{
    # Necessary for using flakes on this system.
    nix.settings.experimental-features = "nix-command flakes";

    # Determinate uses its own daemon to manage the Nix installation
    # that conflicts with nix-darwin's native Nix management.
    nix.enable = false;
}
