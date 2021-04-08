{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gitAndTools.gitFull
    gitAndTools.gh
    git-lfs
  ];
}
