{ pkgs, ... }:

{

    # If fprintd throws 'enroll-unknown-error'
    # https://community.frame.work/t/solved-clear-fingerprint-reader-storage-fingerprint-reader-problems/22951/6

    systemd.services.fprintd = {
      wantedBy = [ "multi-user.target" ];
      serviceConfig.Type = "simple";
    };

    services.fprintd.enable = true;
    services.fprintd.tod.enable = true;
    services.fprintd.tod.driver = pkgs.libfprint-2-tod1-goodix; # Goodix driver module
}
