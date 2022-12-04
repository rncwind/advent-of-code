{ pkgs ? import <nixpkgs> { } }:
with pkgs; let
  haskellDeps = ps:
    with ps; [
      base
      lens
      mtl
      random
    ];
  haskellEnv = haskell.packages.ghc902.ghcWithPackages haskellDeps;
in
mkShell {
  buildInputs = [
    haskellEnv
    haskellPackages.cabal-install
    haskellPackages.stack
    haskellPackages.implicit-hie
    haskellPackages.ormolu
    gdb
    haskell-language-server
  ];

  shellHook = ''
    stackNewNix () {
      stack --nix new $1 --resolver lts-19.33
    }
  '';
}
