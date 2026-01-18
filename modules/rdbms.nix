{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    antares
    # mongodb-compass
  ];

  services = {
    # httpd = {
    #   enable = true;
    #   enablePHP = true;
    #   virtualHosts."localhost" = {
    #     documentRoot = "${pkgs.adminer}";
    #     extraConfig = ''
    #       <Directory />
    #         DirectoryIndex adminer.php
    #         Require all granted
    #       </Directory>
    #     '';
    #   };
    # };

    mysql = {
      enable = true;
      package = pkgs.mariadb;
      # sudo mariadb-secure-installation
    };

    # postgresql = {
    #   enable = true;
    #   package = pkgs.postgresql;
    #   # sudo -u postgres initdb -D /var/lib/postgresql/data
    #   # sudo -u postgres psql
    #   # ALTER USER postgres WITH PASSWORD 'postgres';
    # };

    # mongodb = {
    #   enable = true;
    #   package = pkgs.mongodb-ce;
    # };
  };
}
