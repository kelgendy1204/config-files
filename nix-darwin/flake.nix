{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.11-darwin";
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
    }:
    let
      pkgs = import nixpkgs {
        system = "aarch64-darwin";
      };

      configuration =
        { pkgs, ... }:
        {
          # List packages installed in system profile. To search by name, run:
          # $ nix-env -qaP | grep wget
          environment.systemPackages = with pkgs; [ just ];

          # Necessary for using flakes on this system.
          nix.settings.experimental-features = "nix-command flakes";

          # Determinate uses its own daemon to manage the Nix installation that conflicts with nix-darwin’s native Nix management.
          nix.enable = false;

          # Whether to enable Touch ID with sudo.
          security.pam.services.sudo_local.touchIdAuth = true;

          # Enable alternative shell support in nix-darwin.
          # programs.fish.enable = true;

          # Set Git commit hash for darwin-version.
          system.configurationRevision = self.rev or self.dirtyRev or null;

          # Used for backwards compatibility, please read the changelog before changing.
          # $ darwin-rebuild changelog
          system.stateVersion = 6;

          # The platform the configuration will be used on.
          nixpkgs.hostPlatform = "aarch64-darwin";
        };
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#trv4147
      darwinConfigurations."trv4147" = nix-darwin.lib.darwinSystem {
        modules = [ configuration ];
      };

      formatter.aarch64-darwin = pkgs.writeShellApplication {
        name = "formatter";

        runtimeInputs = with pkgs; [
          nixfmt-tree
          just
        ];

        text = ''
          treefmt .
          just --fmt --unstable
        '';
      };
    };
}
