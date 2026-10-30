#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DEVICE_DIR="${ANDROID_BUILD_TOP:?ANDROID_BUILD_TOP must point to the Android source tree}/device/xiaomi/violet"
test -f "$DEVICE_DIR/AndroidProducts.mk"
install -m 0644 "$ROOT/product/fios_violet.mk" "$DEVICE_DIR/fios_violet.mk"
cat > "$DEVICE_DIR/AndroidProducts.mk" <<'EOF'
PRODUCT_MAKEFILES := \\
    $(LOCAL_DIR)/lineage_violet.mk \\
    $(LOCAL_DIR)/fios_violet.mk

COMMON_LUNCH_CHOICES := \\
    lineage_violet-userdebug \\
    fios_violet-userdebug
EOF
printf 'Registered FiOS product in %s\n' "$DEVICE_DIR"
