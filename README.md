# FiOS Mobile

**By Pratham Tech.**

FiOS Mobile is an AOSP-based Android distribution targeting the Xiaomi Redmi Note 7 Pro (`violet`). The initial engineering baseline is Android 16 using the LineageOS 23.2 device-support ecosystem.

## Project status

- [x] Repository initialized
- [x] Android 16 device-support baseline identified
- [ ] Reproducible source manifest and device integration
- [ ] Proprietary vendor extraction and licensing inventory
- [ ] First successful `userdebug` build
- [ ] Device boot and hardware validation
- [ ] Fi Design Language and system applications

A successful compile is not proof of device compatibility. Boot, radio, Wi-Fi, Bluetooth, camera, audio, sensors, encryption, charging and OTA behavior must be tested on physical hardware.

## Target

| Item | Value |
|---|---|
| Device | Xiaomi Redmi Note 7 Pro |
| Codename | `violet` |
| SoC | Qualcomm Snapdragon 675 / SM6150 |
| GPU | Adreno 612 |
| ABI | ARM64 |
| Android | 16 |
| Build variant | `userdebug` |
| Product | `fios_violet` |

## Build infrastructure

The Android source checkout and build require hundreds of gigabytes of disk and substantial RAM. The GitHub Actions workflow therefore targets a dedicated Ubuntu self-hosted runner labelled `fios-builder` rather than pretending a standard hosted runner has enough disk. See [BUILDING.md](BUILDING.md).

## Device sources

The initial hardware integration reference is the LineageOS `lineage-23.2` branch:

- https://github.com/LineageOS/android_device_xiaomi_violet/tree/lineage-23.2
- https://github.com/LineageOS/android_device_xiaomi_sm6150-common/tree/lineage-23.2
- https://github.com/LineageOS/android_kernel_xiaomi_sm6150/tree/lineage-23.2

These are upstream references, not FiOS-owned code. Their individual licenses and notices remain applicable. Proprietary firmware and vendor blobs are not included in this repository; obtain them from a legally usable device/vendor package and record their provenance before distribution.

## Branding

- OS: FiOS Mobile
- Design system: Fi Design Language
- Maintainer: Pratham Tech.
- Boot emblem: Phi (`Φ`)
