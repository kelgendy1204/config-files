{ config, pkgs-unstable, ... }:

{
    programs.neovim = {
        enable = true;
        package = pkgs-unstable.neovim-unwrapped;

        extraPackages = with pkgs-unstable; [
            lua51Packages.luarocks
            lua51Packages.lua
            prettier
            fd
            typescript-language-server
            typescript
            lua-language-server
            tree-sitter
            ripgrep
            lynx
        ];
    };

    xdg.configFile."nvim" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/config-files/config/nvim";
        recursive = false;
    };
}
