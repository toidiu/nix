{ config, lib, pkgs, ... }:

{
  boot.kernel.sysctl = {
    "vm.nr_hugepages" = 2048;
  };
  environment.systemPackages = with pkgs; [
    dpdk
  ];
}
