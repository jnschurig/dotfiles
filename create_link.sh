#!/usr/bin/env bash
# create-link.sh
# Usage: ./create-link.sh <target_dir> <link_dir>

set -euo pipefail

if [ $# -ne 1 ]; then
  # echo "Usage: $0 <destination_config> <confi_name>"
  echo "Usage: $0 <destination_config>"
  exit 1
fi

DESTINATION_CONFIG="$1"
CONFIG_DIR="$(dirname "$DESTINATION_CONFIG")"
CONFIG_BASE="$(pwd)/$(basename "$DESTINATION_CONFIG")"

# Create parent directories if needed
mkdir -p "$(dirname "$CONFIG_DIR")"

# Create symbolic link
ln -sfn "$CONFIG_BASE" "$CONFIG_DIR"

echo "Created symbolic link: $CONFIG_BASE → $CONFIG_DIR"
