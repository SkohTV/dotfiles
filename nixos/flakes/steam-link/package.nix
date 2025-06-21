{
  stdenv,
  fetchzip,
  # patchelf,
  autoPatchelfHook,
  bzip2,
  libz,
  dbus,
  freetype,
  libopus,
  libsForQt5,
  libva,
  libvdpau,
  SDL2,
}:

let

in stdenv.mkDerivation rec {
  pname = "steam-link";
  version = "1.3.16.287";

  src = fetchzip {
    url = "https://repo.steampowered.com/steamlink/${version}/steamlink-${version}.tgz";
    hash = "sha256-jx06B0ApT8j4RNrnIYA7wSMMh8Csf8n13UTsf9yLq7Q=";
  };

  # https://steamcommunity.com/app/353380/discussions/10/3106892760562833187/?ctp=3#c4376911779060159794
  # patches = [ ./qt-everywhere-src-5.14.1.patch ];

  nativeBuildInputs = [
    autoPatchelfHook
    libsForQt5.wrapQtAppsHook
  ];
  buildInputs = [
    bzip2
    libz
    dbus
    freetype
    libopus
    libsForQt5.qtsvg
    libva
    libvdpau
    SDL2
  ];

  postFixup = ''
    patchelf --add-needed $out/lib/libavcodec.so.61 $out/bin/steamlink
    patchelf --add-needed $out/lib/libavutil.so.59 $out/bin/steamlink
    patchelf --add-needed $out/lib/libSDL3.so.0 $out/bin/steamlink
    patchelf --add-needed $out/lib/libSDL3_image.so.0 $out/bin/steamlink
    patchelf --add-needed $out/lib/libSDL3_mixer.so.0 $out/bin/steamlink
    patchelf --add-needed $out/lib/libSDL3_ttf.so.0 $out/bin/steamlink
    patchelf --add-needed $out/lib/libsteamwebrtc.so $out/bin/steamlink
    patchelf --add-needed $out/lib/libvpx.so.6 $out/bin/steamlink
  '';

  postInstall = ''
    mkdir -p "$out/bin"

    cp "${src}/bin/steamlink" "$out/bin"
    cp "${src}/lib" "$out/" -r

    # patchelf --add-needed $out/lib/
  '';
}
