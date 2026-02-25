{ config, pkgs, inputs, ... }:

{
    programs.neovim = {
        enable = true;

        extraPackages = with pkgs; [
            lua51Packages.luarocks
            lua51Packages.lua
            prettier
            lazygit
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
