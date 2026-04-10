{ ... }:

{
    programs.opencode = {
        enable = true;
    };

    xdg.configFile."opencode/opencode.json" = {
        source = ../../../../config/opencode/opencode.json;
        recursive = false;
    };
}
