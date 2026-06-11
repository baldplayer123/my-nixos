{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = [
    (pkgs.python3.withPackages (ps: with ps; [
      requests
      ipython
    ]))

    pkgs.git
    pkgs.gcc
  ];
}
