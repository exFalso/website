{ pkgs, ... }:

pkgs.mkShell {
  buildInputs = [
    pkgs.zola
  ];
}