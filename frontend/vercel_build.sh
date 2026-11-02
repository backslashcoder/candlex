#!/usr/bin/env bash
# Vercel build step for the CandleX Flutter web app.
# Vercel's build image has no Flutter SDK, so we fetch it, then build the
# release web bundle into build/web (see "outputDirectory" in vercel.json).
set -euo pipefail

# Pin the Flutter channel/tag here, or override via the FLUTTER_VERSION env var
# in the Vercel project settings (e.g. "3.27.1" for a reproducible build).
FLUTTER_VERSION="${FLUTTER_VERSION:-stable}"
FLUTTER_DIR="$HOME/flutter"

echo "==> Fetching Flutter SDK ($FLUTTER_VERSION)"
if [ ! -d "$FLUTTER_DIR/bin" ]; then
  git clone --depth 1 --branch "$FLUTTER_VERSION" https://github.com/flutter/flutter.git "$FLUTTER_DIR"
fi
export PATH="$FLUTTER_DIR/bin:$PATH"

echo "==> Flutter toolchain"
flutter --version
flutter config --enable-web

echo "==> Installing dependencies"
flutter pub get

echo "==> Building web (release)"
flutter build web --release

echo "==> Build complete -> build/web"
