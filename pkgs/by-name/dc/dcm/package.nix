{ lib
, stdenv
, fetchzip
, autoPatchelfHook
}:

stdenv.mkDerivation rec {
  pname = "dcm";
  version = "1.18.1";

  src = fetchzip {
    url = "https://github.com/CQLabs/homebrew-dcm/releases/download/${version}/dcm-linux-x64-release.zip";
    sha256 = "sha256-ilJZN5rfbP6q1UIvJL5Gibr5TnZUCJSHT8yNObi8j5I=";
    stripRoot = false;
  };

  nativeBuildInputs = [
    autoPatchelfHook
  ];

  # sourceRoot = ".";

  installPhase = ''
    runHook preInstall
    install -m755 -D ./dcm $out/bin/dcm
    runHook postInstall
  '';

  meta = {
    description = "Dart Code Metrics";
    homepage = "https://dcm.dev";
    sourceProvenance = with lib.sourceTypes; [ binaryNativeCode ];
    license = lib.licenses.unfree;
    platforms = [ "x86_64-linux" ];
  };
}
