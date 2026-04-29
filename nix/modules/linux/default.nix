{ ... }:

{
    imports = [
        ../shared

        # shared configuration overrides
        ./dev
        ./fonts
        ./packages
        ./programs

        # system specific configuration
        ./system
    ];
}
