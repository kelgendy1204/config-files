{
    pkgs,
    ...
}:

{
    environment.systemPackages = with pkgs; [
        just
        btop
        htop
        nodejs
        gh
    ];
}
