{ config, lib, pkgs, ... }:

{
  networking.firewall = {
    enable = false;
    allowPing = true;
  };
}
