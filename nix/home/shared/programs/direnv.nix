{ pkgs, ... }:

{
    programs.direnv = {
        enable = true;
        package = pkgs.direnv.overrideAttrs (_: {
            doCheck = false;
        });
    };
}
