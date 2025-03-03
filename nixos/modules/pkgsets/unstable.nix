let
  unstable = import <nixos-unstable> {};
in {
  environment.systemPackages = with unstable; [

    # ags # bundler
    # gjs # start ?
    #
    # gobject-introspection # for imports
    # wrapGAppsHook
    #
    #
    # astal.astal3 # core 
    # astal.io # io
    # astal.hyprland # hyprland module

  ];
}
