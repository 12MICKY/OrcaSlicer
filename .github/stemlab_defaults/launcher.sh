#!/bin/bash
APP_SUPPORT="$HOME/Library/Application Support/StemlabSlicer"
MACHINE_DIR="$APP_SUPPORT/user/default/machine"
DEFAULTS_DIR="$(dirname "$0")/../Resources/stemlab_defaults"

if [ ! -f "$MACHINE_DIR/Snapmaker U1-1.json" ]; then
    mkdir -p "$MACHINE_DIR"
    cp "$DEFAULTS_DIR/machine/"*.json "$MACHINE_DIR/"
    chmod 444 "$MACHINE_DIR/"*.json
fi

if [ ! -f "$APP_SUPPORT/StemlabSlicer.conf" ]; then
    mkdir -p "$APP_SUPPORT"
    cp "$DEFAULTS_DIR/OrcaSlicer.conf" "$APP_SUPPORT/StemlabSlicer.conf"
fi

exec "$(dirname "$0")/OrcaSlicer.bin" "$@"
