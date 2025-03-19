{ pkgs, ... }:
{

  users = {

    users.skoh = {
      isNormalUser = true;
      extraGroups = ["wheel" "docker"]; # "wireshark"
      useDefaultShell = true;
    };

  };

}
