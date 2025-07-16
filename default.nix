{
  envs = import ./envs.nix {
    inherit (import <nixpkgs> {}) stdenv fetchurl lib;
  };
}
