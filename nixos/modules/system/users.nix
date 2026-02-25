{ pkgs, ... }:

{
    users.users.khaled = {
        shell = pkgs.zsh;
        isNormalUser = true;
        description = "Khaled Saad";
        extraGroups = [ "networkmanager" "wheel" "docker" ];
        packages = with pkgs; [ volta ];
    };
}
