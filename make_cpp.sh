#!/usr/bin/env bash
set -euo pipefail
cd $(dirname "${BASH_SOURCE[0]}")
mkdir -p build
cd build

echo "Compiling C++ code"
g++ ../svg-to-desmos.cpp -o svg-to-desmos
