{
    pkgs,
    ...
}:

{
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
        just
        btop
        htop
        nodejs
        gh
    ];
}
