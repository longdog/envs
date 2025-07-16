{
  envs = import ./envs.nix {
    inherit (import <nixpkgs> {}) stdenv fetchFromGitHub lib;
  };
}
