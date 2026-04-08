{ pkgs, ... }:

{
    environment.systemPackages = [ pkgs.volta ];
}
