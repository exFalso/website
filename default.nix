{ pkgs, ... }:

pkgs.writeScriptBin "generate-website" ''
  #!${pkgs.bash}/bin/bash
  set -euo pipefail
  cd website && ${pkgs.zola}/bin/zola build
''
