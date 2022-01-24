let
  pkgs = import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/20.09.tar.gz";
  }) {};

  # To update to a newer version of easy-purescript-nix, run:
  # nix-prefetch-git https://github.com/justinwoo/easy-purescript-nix
  #
  # Then, copy the resulting rev and sha256 here.
  # 2022-01-03T21:01:50+02:00
  pursPkgs = import (pkgs.fetchFromGitHub {
    owner = "justinwoo";
    repo = "easy-purescript-nix";
    rev = "678070816270726e2f428da873fe3f2736201f42";
    sha256 = "13l9c1sgakpmh9f23201s8d1lnv0zz0q1wsr1lc92wdpkxs9nii4";
  }) { inherit pkgs; };

in pkgs.stdenv.mkDerivation {
  name = "react-basic-starter";
  buildInputs = with pursPkgs; [
    pursPkgs.purs
    pursPkgs.spago
    pursPkgs.purs-tidy
  ];
}
