{ lib, pkgs-unstable, ... }:

{
    programs.claude-code = {
        enable = true;
        package = pkgs-unstable.claude-code;
    };
}
