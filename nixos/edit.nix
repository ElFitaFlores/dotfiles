{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation rec {
  pname = "edit";
  version = "1.2.0";

  src = pkgs.fetchurl {
    url = "https://github.com/microsoft/edit/releases/download/v${version}/edit-${version}-x86_64-linux-gnu.tar.zst";
    sha256 = "09bv1ag5lb6h3pwzgqx84x8k4gd078yyj3mjpwfwr45w3vrg5sdf";
  };

  nativeBuildInputs = with pkgs; [ zstd ];

  unpackPhase = ''
    tar --use-compress-program=${pkgs.zstd}/bin/unzstd -xf $src
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp edit $out/bin/
    chmod +x $out/bin/edit
  '';

  meta = with pkgs.lib; {
    description = "Microsoft Edit - Command line editor";
    homepage = "https://github.com/microsoft/edit";
    license = licenses.mit;
    platforms = platforms.linux;
  };
}
