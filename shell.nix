{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    age
    bashInteractive
    go_1_17
    gnumake
    openssl
    sops
    gh
    shellcheck
    shfmt
    bats
  ];
}
