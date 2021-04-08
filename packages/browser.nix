{ config, lib, pkgs, ... }:

{
  # starbucks login
  networking.extraHosts = ''
    172.31.98.1 aruba.odyssys.net
  '';

  environment.systemPackages = with pkgs; [
    chromium
    firefox
  ];
}
