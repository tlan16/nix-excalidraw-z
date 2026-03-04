{ lib
, stdenvNoCC
, fetchurl
, undmg
}:

stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "excalidrawz";
  version = "1.7.2";

  src = fetchurl {
    url = "https://github.com/chocoford/ExcalidrawZ/releases/download/v${finalAttrs.version}/ExcalidrawZ.${finalAttrs.version}.dmg";
    hash = "sha256-H0OBJqvH91u10H0WB9bVWhV6Qt4o9mLPtcPA0atQpvE=";
  };

  nativeBuildInputs = [ undmg ];

  # undmg sets up the DMG contents in the current directory
  sourceRoot = ".";

  installPhase = ''
    runHook preInstall

    mkdir -p "$out/Applications"
    cp -r ExcalidrawZ.app "$out/Applications/"

    runHook postInstall
  '';

  meta = {
    description = "Excalidraw app for macOS, powered by pure SwiftUI";
    longDescription = ''
      ExcalidrawZ wraps the Excalidraw web app into a native macOS client that
      automatically saves your files, supports file grouping, iCloud Drive sync,
      collaboration, Quick Look previews, and more.
    '';
    homepage = "https://github.com/chocoford/ExcalidrawZ";
    changelog = "https://github.com/chocoford/ExcalidrawZ/releases/tag/v${finalAttrs.version}";
    license = lib.licenses.mit;
    sourceProvenance = with lib.sourceTypes; [ binaryNativeCode ];
    maintainers = [ ];
    platforms = [ "aarch64-darwin" ];
  };
})
