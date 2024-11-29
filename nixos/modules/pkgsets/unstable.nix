let
  unstable = import <nixos-unstable> {};

in {
  environment.systemPackages = with unstable; [
    
  ];
}
