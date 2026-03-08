{ ... }:

{
    imports = [
        ./default.nix

        # DE settings: uncomment one, comment the others
        ./programs/sway-settings.nix
    ];

    home.username = "khaled";
    home.homeDirectory = "/home/khaled";
}
