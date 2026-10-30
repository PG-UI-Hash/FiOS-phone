# Building FiOS Mobile

## Build host

Use a dedicated Ubuntu 22.04/24.04 x86_64 machine registered as a GitHub Actions self-hosted runner with labels `self-hosted`, `Linux`, `X64`, `fios-builder`.

Recommended minimum: 16 CPU threads, 64 GiB RAM and 400 GiB free SSD space. Standard GitHub-hosted runners do not have enough disk for a full AOSP build. Keep the runner updated and do not expose an untrusted workflow to a privileged self-hosted runner.

## Source baseline

The manifest uses the Android 16-era LineageOS 23.2 device-support branch. This is a hardware integration baseline, not proof that a FiOS image boots.

Initialize source with:

```bash
mkdir -p ~/android/fios && cd ~/android/fios
repo init -u https://github.com/LineageOS/android.git -b lineage-23.2 --git-lfs
mkdir -p .repo/local_manifests
cp /path/to/FiOS-phone/manifests/fios_violet.xml .repo/local_manifests/
repo sync -c --no-clone-bundle --no-tags -j"$(nproc)"
```

## Proprietary files

The device tree inherits proprietary makefiles under `vendor/xiaomi/violet` and `vendor/xiaomi/sm6150-common`. These are not included in the public device/kernel manifest. Extract them from compatible stock firmware/device using the selected device tree's extraction scripts, or obtain a redistributable vendor package with clear provenance and licensing. The workflow intentionally fails if these trees are missing.

## Build

```bash
source build/envsetup.sh
lunch lineage_violet-userdebug
mka bacon
```

This initial milestone builds the upstream device integration target. FiOS product branding and applications will be layered on after the baseline is reproducible. Product makefiles, lunch target, OTA metadata and releasetools must be changed consistently, not renamed blindly.

## Validation

A successful compile is not a successful ROM release. Validate image contents, partition sizes, boot/recovery format, AVB configuration and firmware compatibility against a real violet device. Test boot, encryption, telephony, mobile data, Wi-Fi, Bluetooth, GPS, cameras, audio, sensors, fingerprint, charging, suspend/resume and OTA behavior.

Never flash an unverified image to a primary device. Keep a known-good recovery path and complete backup.
