{
    description = "Khaled's Nix system";

    inputs = {
        # Stable nixpkgs for Linux is used for nixos configuration.
        nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

        # Stable nixpkgs for Darwin is used for nix-darwin configuration.
        nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-25.11-darwin";

        nix-darwin = {
            url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
            inputs.nixpkgs.follows = "nixpkgs-darwin";
        };

        # Unstable nixpkgs for Linux, exposed as pkgs-unstable in NixOS modules and home-manager.
        nixos-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

        # Unstable nixpkgs for Darwin, exposed as pkgs-unstable in Darwin modules and home-manager.
        nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

        home-manager = {
            url = "github:nix-community/home-manager/release-25.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs =
        {
            self,
            nixpkgs,
            nixpkgs-darwin,
            nixos-unstable,
            nixpkgs-unstable,
            nix-darwin,
            home-manager,
            ...
        }:
        let
            nixpkgsConfig = { allowUnfree = true; };
            linuxUnstable = import nixos-unstable { system = "x86_64-linux"; config = nixpkgsConfig; };
            darwinUnstable = import nixpkgs-unstable { system = "aarch64-darwin"; config = nixpkgsConfig; };
        in
        {
            nixosConfigurations.lenovo-laptop = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                    { nixpkgs.config = nixpkgsConfig; }
                    ./hosts/lenovo-laptop
                    home-manager.nixosModules.default
                    {
                        home-manager = {
                            useGlobalPkgs = true;
                            useUserPackages = true;
                            extraSpecialArgs = {
                                pkgs-unstable = linuxUnstable;
                            };
                            users.khaled = {
                                imports = [ ./home/linux/lenovo-laptop ];
                                home.username = "khaled";
                                home.homeDirectory = "/home/khaled";
                            };
                        };
                    }
                ];
                specialArgs = {
                    pkgs-unstable = linuxUnstable;
                };
            };

            darwinConfigurations.trv4147 = nix-darwin.lib.darwinSystem {
                modules = [
                    { nixpkgs.config = nixpkgsConfig; }
                    ./hosts/trv4147
                    home-manager.darwinModules.default
                    {
                        home-manager = {
                            useGlobalPkgs = true;
                            useUserPackages = true;
                            extraSpecialArgs = {
                                pkgs-unstable = darwinUnstable;
                            };
                            users.kelgendy = {
                                imports = [ ./home/darwin/trv4147 ];
                                home.username = "kelgendy";
                                home.homeDirectory = "/Users/kelgendy";
                            };
                        };
                    }
                ];
                specialArgs = {
                    inherit self;
                    pkgs-unstable = darwinUnstable;
                };
            };

            formatter.aarch64-darwin =
                let
                    pkgs = import nixpkgs-darwin { system = "aarch64-darwin"; };
                in
                    pkgs.writeShellApplication {
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
