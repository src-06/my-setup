{ pkgs, ... }:

{
  users.users.leo = {
    isNormalUser = true;
    home = "/home/leo";
    description = "Gotthard Leo";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
  };

  users.users.root = {
    shell = pkgs.fish;
  };
}
