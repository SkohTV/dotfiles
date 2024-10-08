{ config, lib, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];


  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "thunderbolt" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  # swapDevices = [{
  #   device = "/swapfile";
  #   size = 16*1024; # 16G
  # }];
  # boot.resumeDevice = "/dev/nvme0n1p2";
  # boot.kernelParams = [ "resume_offset="];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/93aae3a2-2e24-4918-b07a-7dd7286f97da";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/85A6-A39D";
    fsType = "vfat";
    options = [ "fmask=0022" "dmask=0022" ];
  };


  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.docker0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp1s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
