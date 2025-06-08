{ pkgs, ... }:
{

  ### SERVICES
  services = {
    flatpak.enable = true; # Flatpaks
    upower.enable = true; # Power stuff
    openssh.enable = true; # ssh
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

        # Wait for network connection before vault push
        while [ "$(ip add sh wlp1s0 | grep inet)" = "" ]; do
          echo "Waiting for network..."
          sleep 3
        done

        # Push vault
        ${pkgs.git}/bin/git -C /home/skoh/dev/repo/vault/ push origin

      '';
    };

  };

}
