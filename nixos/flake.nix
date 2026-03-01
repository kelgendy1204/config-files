{
    description = "Khaled's NixOS system";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = {
        self,
        nixpkgs,
        home-manager,
        ...
    }: {
        nixosConfigurations.lenovo-laptop = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
                ./hosts/lenovo-laptop
            ];
        };

        homeConfigurations = {
            "khaled@lenovo-laptop" = home-manager.lib.homeManagerConfiguration {
                pkgs = nixpkgs.legacyPackages.x86_64-linux;
                modules = [ ./home/lenovo-laptop.nix ];
            };

            "kelgendy@trv4147" = home-manager.lib.homeManagerConfiguration {
                pkgs = nixpkgs.legacyPackages.aarch64-darwin;
                modules = [ ./home/trv4147.nix ];
            };
        };
    };
}
