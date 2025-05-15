{ pkgs, ... }:
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
      path = ["/run/current-system/sw"];

      serviceConfig = {
        Type = "oneshot";
        User = "skoh";
      };

      script = ''
        # Commit obsidian vault
        eval "$(ssh-agent -s)"
        ssh-add ~/.ssh/github

        ${pkgs.git}/bin/git -C /home/skoh/dev/repo/vault/ add .
        ${pkgs.git}/bin/git -C /home/skoh/dev/repo/vault/ diff-index --quiet HEAD ||\
            ${pkgs.git}/bin/git -C /home/skoh/dev/repo/vault/ commit -m "Auto commit: $(date +'%a, %d %b %Y')"
        ${pkgs.git}/bin/git -C /home/skoh/dev/repo/vault/ push origin


        # Change wp
        export HYPRLAND_INSTANCE_SIGNATURE=$(hyprctl instances -j | jq -r '.[0].instance')
        /home/skoh/dev/scripts/randomize_wallpaper.sh
        hyprctl hyprpaper reload eDP-1,/home/skoh/.config/wallpapers/main 
      '';
    };

  };

}
