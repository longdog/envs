{
  lib,
  stdenv,
  fetchurl,
}:

stdenv.mkDerivation rec {
  pname = "envs";
  version = "1.1.1";

  src = fetchurl {
    url = "https://github.com/longdog/envs/archive/refs/tags/v${version}.tar.gz";
    sha256 = "sha256-gvuw/Jj/uCS9E9Xi90zm/IgBywZUbycAj4TZBPfMJR4=";
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
