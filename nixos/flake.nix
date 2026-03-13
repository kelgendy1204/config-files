{
    description = "Khaled's NixOS system";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        darwin = {
            url = "github:nix-darwin/nix-darwin";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = {
        self,
        nixpkgs,
        darwin,
        home-manager,
        ...
    }: {
        nixosConfigurations.lenovo-laptop = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
                ./hosts/lenovo-laptop
                home-manager.nixosModules.default
                {
                    home-manager = {
                        useGlobalPkgs = true;
                        useUserPackages = true;
                        users.khaled = import ./home;
                    };
                }
            ];
        };

        darwinConfigurations.trv4147 = darwin.lib.darwinSystem {
            system = "aarch64-darwin";
            modules = [
                ./hosts/trv4147
                home-manager.darwinModules.home-manager
                {
                    home-manager = {
                        useGlobalPkgs = true;
                        useUserPackages = true;
                        users.kelgendy = import ./home/darwin.nix;
                    };
                }
            ];
        };
    };
}
