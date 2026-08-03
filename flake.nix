{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };
  outputs = {nixpkgs, ...}: 
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in 
  {
    devShells.${system}.default = pkgs.mkShell 
    {
      packages = with pkgs;
        [ 
          rustc
          cargo
          rustfmt
          clippy
          rust-analyzer 
        ];
      RUST_SRC_PATH = "${pkgs.rustPlatform.rustLibSrc}";
      # shellHook = ''
      #   ${pkgs.hello}/bin/hello
      # '';
    };
  };
}