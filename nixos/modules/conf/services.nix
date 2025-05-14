{ ... }:
{

  ### SERVICES
  services = {
    flatpak.enable = true; # Flatpaks
    upower.enable = true; # Power stuff
    openssh.enable = true; # ssh

    ollama = { # ollama for nvim
      enable = true;
      acceleration = "rocm";
    };
  };


  ### TIMERS
  systemd = {

    timers."daily-chores" = {
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnCalendar = "daily";
        Persistent = true; 
    };
  };


    services."daily-chores" = {
      script = ''
        # Commit obsidian vault
        cd /home/skoh/dev/repo/vault/
        git add . && git commit -m "Auto commit: $(date +'%a, %d %b %Y')" && git push origin

        # Change wp
        /home/skoh/dev/scripts/randomize_wallpaper.sh
        hyprctl hyprpaper reload eDP-1,/home/skoh/.config/wallpapers/main 
      '';
      serviceConfig = {
        Type = "oneshot";
        User = "root";
      };
    };

  };

}
