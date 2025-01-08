{ ... }:
{

  services = {
    flatpak.enable = true; # Flatpaks
    upower.enable = true; # Power stuff
    openssh.enable = true; # ssh

    ollama = { # ollama for nvim
      enable = true;
      acceleration = "rocm";
    };
  };

}
