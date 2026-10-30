# Redmi Note 7 Pro device integration

## Verified upstream references

All references below are public upstream repositories. FiOS does not claim authorship of their code.

- Device-specific tree: `LineageOS/android_device_xiaomi_violet`, branch `lineage-23.2`
- Common SM6150 tree: `LineageOS/android_device_xiaomi_sm6150-common`, branch `lineage-23.2`
- Kernel: `LineageOS/android_kernel_xiaomi_sm6150`, branch `lineage-23.2`
- Xiaomi hardware support: `LineageOS/android_hardware_xiaomi`, branch `lineage-23.2`

## Board configuration observations

The violet BoardConfig inherits the SM6150 common configuration. The inspected common configuration specifies ARM64, a 4 KiB kernel page size, gzip-compressed kernel image, boot image header v2, separate DTBO handling, dynamic partitions and AVB support. Violet's BoardConfig supplies device-specific boot/cache/recovery sizes and dynamic partition parameters.

These are build-time declarations from upstream source, not a substitute for reading the actual device partition map. Before flashing, collect `fastboot getvar all`, inspect `/dev/block/by-name` from recovery, and verify bootloader/firmware requirements for the exact handset variant. Do not repartition based only on a BoardConfig value.

## Vendor components

The violet product inherits `vendor/xiaomi/violet/violet-vendor.mk`; the common BoardConfig inherits `vendor/xiaomi/sm6150-common/BoardConfigVendor.mk`. Those proprietary trees are a separate prerequisite. Preserve upstream license notices and do not publish extracted proprietary blobs unless their license permits redistribution.

## Hardware test matrix

No FiOS hardware tests have been completed yet. Record results for boot, encryption, calls/SMS, LTE data, Wi-Fi, Bluetooth, GPS, rear/front cameras, audio, fingerprint, proximity/ambient sensors, charging, thermal behavior, suspend/resume and OTA before declaring support.
