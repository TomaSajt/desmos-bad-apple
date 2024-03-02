#!/usr/bin/env bash
set -euo pipefail
cd $(dirname "${BASH_SOURCE[0]}")
mkdir -p build
cd build

echo "Generating Desmos expressions"
rm -rf desmos
mkdir -p desmos
for svg in svgs/*.svg; do
    outname="$(basename $svg ".svg").txt"
    ./svg-to-desmos $svg > "desmos/$outname"
done
