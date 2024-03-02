#!/usr/bin/env bash
set -euo pipefail
cd $(dirname "${BASH_SOURCE[0]}")
mkdir -p build
cd build

echo "Creating curves.json"
rm -rf json
mkdir -p json
for file in desmos/*.txt; do
    outname="$(basename $file ".txt").json"
    { read -r P1 && read -r P2 && read -r P3 && read -r P4; } < $file
    jq -n --arg P1 $P1 --arg P2 $P2 --arg P3 $P3 --arg P4 $P4 '[$P1, $P2, $P3, $P4]' > "json/$outname"
done

jq --slurp '.' json/* > curves.json

echo "Creating curves.js"
sed curves.json -e 's/^\[$/const curves = [/g' > ../curves.js
