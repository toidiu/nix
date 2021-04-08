{ config, lib, pkgs, ... }:
let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in
{
  environment.systemPackages = with pkgs; [
    cargo-asm
    cargo-audit
    cargo-bloat
    cargo-crev
    unstable.cargo-deny
    cargo-edit
    cargo-expand
    cargo-flamegraph
    cargo-geiger
    cargo-generate
    unstable.cargo-insta
    cargo-make
    cargo-outdated
    cargo-sweep
    cargo-udeps
    cargo-watch
    cargo-xbuild
    rustup
    unstable.rust-analyzer
    sccache
  ];

  systemd.services.sccache = {
    wantedBy = [ "multi-user.target" ];
    description = "Start sccache server";
    serviceConfig = {
      Type = "forking";
      User = "cameron";
      ExecStart = "${pkgs.sccache.outPath}/bin/sccache --start-server";
      ExecStop = "${pkgs.sccache.outPath}/bin/sccache --stop-server";
    };
  };
}
