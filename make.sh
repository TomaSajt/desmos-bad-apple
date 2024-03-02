#!/usr/bin/env bash
set -euo pipefail
cd $(dirname "${BASH_SOURCE[0]}")

./make_svgs.sh
./make_cpp.sh
./make_desmos.sh
./make_json.sh

echo "Done!"
