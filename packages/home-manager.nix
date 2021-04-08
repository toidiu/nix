{ config, lib, pkgs, ... }:
let
  home-manager = builtins.fetchTarball {
    url = "https://github.com/rycee/home-manager/archive/release-20.09.tar.gz";
    #sha256 = "0iksjch94wfvyq0cgwv5wq52j0dc9cavm68wka3pahhdvjlxd3js";
  };
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];
}
