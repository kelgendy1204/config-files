{ ... }:

{
    imports = [
        ./default.nix
        ./programs/gnome-settings.nix    # Desktop: swap with ./programs/kde-settings.nix to switch
        # ./programs/kde-settings.nix
    ];

    home.username = "khaled";
    home.homeDirectory = "/home/khaled";
}
