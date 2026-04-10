{ ... }:

{
    environment.systemPath = [ "/opt/homebrew/bin" ];

    homebrew = {
        enable = true;
        brews = [
            "cs-mcp"
        ];

        casks = [
            "menumeters"
            "appcleaner"
        ];
    };
}
