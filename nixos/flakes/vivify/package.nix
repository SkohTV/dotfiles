{
  lib,
  stdenv,
  fetchYarnDeps,
  fetchFromGitHub,
  yarnConfigHook,
  npmHooks,
  nodejs,
  zip,
  file,
}:

stdenv.mkDerivation rec {
  pname = "vivify";
  version = "0.8.2";

  src = fetchFromGitHub {
    owner = "jannis-baum";
    repo = "Vivify";
    tag = "v${version}";
    hash = "sha256-2lxf21T9y4GMFlk0+qbaJJ/twRffYEBoBXZXe/NRDQk=";
  };

  yarnOfflineCache = fetchYarnDeps {
    yarnLock = "${src}/yarn.lock";
    hash = "sha256-mOgfwetiLMTDquw3f3+U1iEhBbvf0OC5lkNJHdrRSK0=";
  };

  postPatch = ''
    cp ${./package.json} package.json
  '';

    installPhase = ''
    runHook preInstall

    yarn install

    substituteInPlace node_modules/.bin/tsc \
      --replace-fail '/usr/bin/env node' '${nodejs}/bin/node'

    substituteInPlace node_modules/.bin/webpack \
      --replace-fail '/usr/bin/env node' '${nodejs}/bin/node'

    substituteInPlace node_modules/.bin/postject \
      --replace-fail '/usr/bin/env node' '${nodejs}/bin/node'

    make linux

    mkdir -p $out/bin
    install -Dm755 ./build/linux/viv $out/bin/viv
    install -Dm755 ./build/linux/vivify-server $out/bin/vivify-server
  '';

  nativeBuildInputs = [
    yarnConfigHook
    npmHooks.npmInstallHook
    zip
    nodejs
  ];

  buildinputs = [
    file
    nodejs
  ];

  # Stripping 'unneeded symbols' causes vivify-server executable to break
  # (segmentation fault)
  dontStrip = 1;

  meta = {
    description = "CLI to load dotenv files";
    homepage = "https://github.com/entropitor/dotenv-cli";
    changelog = "https://github.com/entropitor/dotenv-cli/releases/tag/v${version}";
    license = lib.licenses.mit;
    mainProgram = "dotenv";
    maintainers = with lib.maintainers; [ skohtv ];
  };
}
