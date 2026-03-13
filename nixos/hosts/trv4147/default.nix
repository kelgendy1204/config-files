{ pkgs, ... }:

{
    nixpkgs.config.allowUnfree = true;

    # Required for nix-darwin
    services.nix-daemon.enable = true;
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # Set your shell
    programs.zsh.enable = true;

    system.stateVersion = 6;
}
