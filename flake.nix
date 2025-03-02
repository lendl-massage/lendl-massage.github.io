{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      # config.allowUnfree = true;
    };
  in {
    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [
        nodePackages.prettier
      ];
    };
  };
}
