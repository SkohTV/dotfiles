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

  # systemd = {
  #   timers."obsidian-commit" = {
  #     wantedBy = [ "timers.target" ];
  #     timerConfig = {
  #       OnCalendar = "daily";
  #       Persistent = true; 
  #   };
  # }
  #
  #
  #   services."obsidian-commit" = {
  #     script = ''
  #       set -eu
  #       ${pkgs.coreutils}/bin/echo "Hello World"
  #     '';
  #     serviceConfig = {
  #       Type = "oneshot";
  #       User = "root";
  #     };
  #   };
  #
  # }

}
