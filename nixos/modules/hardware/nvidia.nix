{ config, ... }:
{

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];

  hardware = {

    # Enable OpenGL
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };

    # Nvidia config
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;

      # To work in pair with integrated gpu
      prime = {
        sync.enable = true;
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };

  };

}
