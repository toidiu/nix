{ config, lib, pkgs, ... }:

{
  virtualisation.docker = {
    enable = true;
    storageDriver = "devicemapper";
    extraOptions = "-g /home/toidiu/.docker --storage-opt dm.basesize=20G";
  };
}
