# Photo Stream

Jekyll photo site. Originals live in `photos/original`; Jekyll generates thumbnails/large/tint at build time.

## Adding photos
When the user gives photos (paths or a folder), run `./add-photos.sh <paths>` — it resizes to 3024px, JPEG q85, strips GPS, keeps capture date. Filename becomes the photo title (e.g. `Boston at Night.jpeg`). Ask for titles if files are named IMG_xxxx.

Then preview/build, commit only `photos/`, and push to `master` (confirm before pushing).

## Build
```
export PATH="/opt/homebrew/opt/ruby/bin:$PATH" LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8
bundle exec jekyll serve   # http://localhost:4000
```

## Rules
- Never commit unoptimized originals; history was squashed once (2026-10-28) to cut repo size. Don't re-add large files.
- `_site/`, `vendor/`, `.bundle/` are ignored.
