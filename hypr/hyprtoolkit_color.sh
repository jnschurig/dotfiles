#!/usr/bin/env sh

pkill -x hyprlauncher

SCRIPT_DIR="$(cd -- "$(dirname -- "$0")" && pwd)"

/home/linuxbrew/.linuxbrew/bin/termcolors --source ghostty | jq -r '
"background=0xff\(.special.background | ltrimstr("#"))
accent=0xff\(.palette[4] | ltrimstr("#"))
accent_secondary=0xff\(.palette[10] | ltrimstr("#"))
base=0xff\(.palette[0] | ltrimstr("#"))
alrernate_base=0xff\(.palette[8] | ltrimstr("#"))
text=0xff\(.special.foreground | ltrimstr("#"))
bright_text=0xff\(.special.selection_foreground | ltrimstr("#"))
font_size=12
# font_family=bold
"
' > "$SCRIPT_DIR/hyprtoolkit.conf"
echo "done"


