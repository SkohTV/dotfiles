{ pkgs, ... }:
{

  services = {

    # For postgresql
    postgresql = {
      enable = true;
      ensureDatabases = ["mydatabase"];
      authentication = pkgs.lib.mkOverride 10 ''
        #type database  DBuser  auth-method
        local   all             all                                     trust
        host    all             all             127.0.0.1/32            trust
        host    all             all             ::1/128                 trust
      '';
    };

    # For mysql
    mysql = {
      enable = true;
      package = pkgs.mariadb;
    };

    # Setup httpd
    httpd = {
      enable = true;
      enablePHP = true;
      virtualHosts."php.localhost" = {
        documentRoot = "/var/www/phplocalhost";
      };
    };

  };

  # Edit /etc/host.conf
  networking.extraHosts = ''
    127.0.0.1 php.localhost
  '';

}
