{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "nixos-minimal-grub-theme";
  version = "1.0";
  src = ./theme;

  installPhase = ''
    mkdir -p $out
    cp -r $src/* $out/
  '';
}
