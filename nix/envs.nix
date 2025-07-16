{
  lib,
  stdenv,
  fetchFromGitHub,
}:

stdenv.mkDerivation rec {
  pname = "envs";
  version = "1.1.1";

  src = fetchFromFitHub {
    owner = "longdog";
    repo = "envs";
    rev = "v${version}";
    sha256 = "sha256-xxxxxxxxxxxxxxxxxxxx";
  };

  installPhase = ''
    mkdir -p $out/bin
    cp envs $out/bin/envs
    chmod +x $out/bin/envs
  '';

  meta = {
    description = "A simple .env file manager";
    homepage = "https://github.com/longdog/envs";
    license = lib.licenses.mit;
    maintainers = [
      {
        name = "Denis Abrosimov";
        github = "longdog";
      }
    ];
    platforms = lib.platforms.unix;
  };
}
