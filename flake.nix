{
  description = "An interactive environment for working at SUSE";
  inputs.nixpkgs.url = "nixpkgs/nixos-22.05";
  outputs = { self, nixpkgs }:
    let
      lastModifiedDate = self.lastModifiedDate or self.lastModified or "19700101";
      version = builtins.substring 0 8 lastModifiedDate;
      supportedSystems = [ "x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin" ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
      nixpkgsFor = forAllSystems (system: import nixpkgs { inherit system; });
    in
    {
      devShells = forAllSystems (system:
        let 
          pkgs = nixpkgsFor.${system};
        in {
          default = pkgs.mkShell {
            buildInputs = with pkgs; [ 
              age
              bashInteractive
              bats
              binutils
              curl
              file
              gcc
              gh
              git 
              gnumake
              go-tools
              go_1_18
              gopls
              gotools
              nettools
              nixpkgs-fmt
              openssl
              shellcheck
              shfmt
              sops
              terraform
              terragrunt
              wget
              yq
            ];
        };
      });
      devShell = forAllSystems (system: self.devShells.${system}.default);
    };
}

