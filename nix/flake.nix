{
    description = "Khaled's Nix system";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

        nixpkgs-darwin.url = "github:NixOS/nixpkgs/nixpkgs-25.11-darwin";

        nix-darwin = {
            url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
            inputs.nixpkgs.follows = "nixpkgs-darwin";
        };

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
            nixpkgs-unstable,
            nix-darwin,
            home-manager,
            ...
        }:
        {
            nixosConfigurations.lenovo-laptop = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                    ./hosts/lenovo-laptop
                    home-manager.nixosModules.default
                    {
                        home-manager = {
                            useGlobalPkgs = true;
                            useUserPackages = true;
                            extraSpecialArgs = {
                                pkgs-unstable = import nixpkgs-unstable { system = "x86_64-linux"; };
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
                    pkgs-unstable = import nixpkgs-unstable { system = "x86_64-linux"; };
                };
            };

            darwinConfigurations.trv4147 = nix-darwin.lib.darwinSystem {
                modules = [
                    ./hosts/trv4147
                    home-manager.darwinModules.default
                    {
                        home-manager = {
                            useGlobalPkgs = true;
                            useUserPackages = true;
                            extraSpecialArgs = {
                                pkgs-unstable = import nixpkgs-unstable { system = "aarch64-darwin"; };
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
                    pkgs-unstable = import nixpkgs-unstable { system = "aarch64-darwin"; };
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
