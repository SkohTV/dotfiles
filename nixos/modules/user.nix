{ pkgs, ... }:
{

  users = {

    defaultUserShell = pkgs.zsh;

    users.skoh = {
      isNormalUser = true;
      extraGroups = ["wheel" "docker"]; # "wireshark"
      useDefaultShell = true;
    };

  };


  environment = {
    etc."zsh/zplug.zsh".source = "${pkgs.zplug}/share/zplug/init.zsh";
    pathsToLink = ["/libexec"];
  };

}
