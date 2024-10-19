{ ... }:
{

  networking = {

    networkmanager.enable = true;
    useDHCP = false;
    interfaces.wlp1s0.useDHCP = true;

    # Firewall setup
    firewall.enable = false;
  };

}
