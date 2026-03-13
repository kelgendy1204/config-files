{ pkgs, ... }:

{
    home.username = "kelgendy";
    home.homeDirectory = "/Users/kelgendy";

    home.packages = with pkgs; [
        cowsay
    ];

    home.stateVersion = "25.11";
}
