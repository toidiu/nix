{ config, lib, pkgs, ... }:

{
  services.dnsmasq = {
    enable = true;
    extraConfig = ''
      address=/local/127.0.0.1
    '';
  };
}
