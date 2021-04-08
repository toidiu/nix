{ config, lib, pkgs, ... }:

{
  virtualisation.docker = {
    enable = true;
    storageDriver = "devicemapper";
    extraOptions = "-g /home/cameron/.docker --storage-opt dm.basesize=20G";
  };
}
