#!/bin/bash
# Usage: ./add-photos.sh <photo-or-folder> [...]
# Resizes to max 3024px, JPEG q85, strips GPS (keeps capture date), copies into photos/original.
set -e
cd "$(dirname "$0")"
command -v exiftool >/dev/null || { echo "Install exiftool: brew install exiftool"; exit 1; }
[ $# -gt 0 ] || { echo "Usage: $0 <photo-or-folder> ..."; exit 1; }
for arg in "$@"; do
  if [ -d "$arg" ]; then set -- "$@" "$arg"/*; continue; fi
  case "$(echo "${arg##*.}" | tr A-Z a-z)" in jpg|jpeg|heic|png) ;; *) continue ;; esac
  name="$(basename "${arg%.*}").jpeg"
  sips -Z 3024 -s format jpeg -s formatOptions 85 "$arg" --out "photos/original/$name" >/dev/null
  exiftool -q -overwrite_original -gps:all= "photos/original/$name"
  echo "added: $name ($(du -h "photos/original/$name" | cut -f1))"
done
echo "Next: git add photos && git commit -m 'Add photos' && git push"
