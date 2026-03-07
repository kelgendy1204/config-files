{ ... }:

{
    # KDE Plasma input settings
    home.file.".config/kcminputrc".text = ''
        [Libinput][*][*]
        NaturalScroll=true
        TapToClick=true

        [Mouse]
        NaturalScroll=true
    '';
}
