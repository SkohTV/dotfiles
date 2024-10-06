{
  disko.devices = {
    disk = {
      main = {

        devices = "/dev/nvme0n1";
        content = {
          type = "gpt";

          partitions = {

            boot = {
              size = "1M";
              type = "EF02"; # for grub MBR
            };

            ESP = {
              size = "1G";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };

            nix = {
              size = "200G";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
              };
            };

            swap = {
              size = "16G";
              content = {
                type = "swap";
                discardPolicy = "both";
                resumeDevice = true;
              };

            };

            root = {
              size = "100%";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
              };
            };

          };
        };
      };
    };
  };
}
