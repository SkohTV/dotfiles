_ :
{

  networking = {

    networkmanager.enable = true;
    useDHCP = false;
    interfaces.wlp0s20f3.useDHCP = true;

    # Firewall setup
    firewall.enable = false;
  };

}
