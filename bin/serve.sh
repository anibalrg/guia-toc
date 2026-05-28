#!/usr/bin/env sh
# serve.sh [options]
# Full rebuild options: --ignoreCache --forceSyncStatic --gc
readonly iface="wlan0"
readonly localIP=$(ip address | awk -F" " '/^[[:space:]]+inet[[:space:]]/ { split($2, s, "/");  print $NF "\t" s[1]  }' | grep $iface | cut -f2)
readonly port=8000
echo "Serving at $localIP:$port"
hugo serve --logLevel=debug --disableFastRender --bind $localIP --port $port $*
