{ pkgs, ... }:
{

  users = {

    defaultUserShell = pkgs.zsh;

    users.qlpth = {
      isNormalUser = true;
      extraGroups = ["wheel" "docker" "wireshark"]; # Enable ‘sudo’ for the user.
      useDefaultShell = true;
    };

  };


  environment = {
    etc."zsh/zplug.zsh".source = "${pkgs.zplug}/share/zplug/init.zsh";
    pathsToLink = ["/libexec"];
  };

}
