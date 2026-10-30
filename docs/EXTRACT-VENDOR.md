# Register the build runner and extract vendor files

## Register a self-hosted runner

1. Open https://github.com/PG-UI-Hash/FiOS-phone/settings/actions/runners.
2. Choose **New self-hosted runner**.
3. Choose **Linux** and **x64**.
4. Run the exact download/configuration commands GitHub displays on the Ubuntu build machine.
5. Name the runner `fios-builder` and add the custom label `fios-builder`. Keep the default labels.
6. Install it as a service on a dedicated machine if appropriate. The machine must remain online during builds.

The current workflow expects an Ubuntu x86_64 runner, sudo access for package installation, at least 250 GB free disk according to its preflight check, and preferably 400 GB or more. 64 GiB RAM is a sensible starting point. Never expose this privileged runner to untrusted pull-request workflows.

## Extract blobs from the physical phone

The Redmi Note 7 Pro can supply its own proprietary files while running compatible stock firmware.

1. On the phone, enable Developer options and USB debugging. Connect it to the Ubuntu runner host and accept the authorization prompt.
2. Install ADB: `sudo apt install android-tools-adb`.
3. Confirm `adb devices` lists the phone with state `device`.
4. Run the FiOS workflow once. It synchronizes the Android source into the persistent directory `/opt/fios/android` and will stop at vendor validation if blobs are not present.
5. On the runner host, run:

```bash
cd /opt/fios/android/device/xiaomi/violet
./extract-files.py
```

The violet extraction utility is configured with `ExtractUtils.device_with_common(..., 'sm6150-common', ...)`, so it handles the violet device and shared SM6150 vendor files. The expected outputs are:

- `/opt/fios/android/vendor/xiaomi/violet`
- `/opt/fios/android/vendor/xiaomi/sm6150-common`

6. Verify both directories exist and contain generated makefiles and proprietary files. Re-run the GitHub Actions workflow.

If the extractor reports missing files, check that the phone is on the firmware version expected by the branch's `proprietary-files.txt`. Do not ignore missing required blobs. If ADB extraction cannot access a required file, use a matching official stock firmware package as the extraction source and follow the extractor's supported local-source options.

## Privacy and licensing

Keep extracted vendor files on the private build host. Do not commit them to the public FiOS repository or publish them in build artifacts unless the relevant proprietary licenses explicitly permit redistribution. The public device tree's extraction scripts and file lists are not themselves permission to redistribute vendor binaries.

## Current workflow storage layout

- Android source and extracted vendor trees: `/opt/fios/android`
- Optional externally staged vendor trees: `/opt/fios/vendor/xiaomi/{violet,sm6150-common}`
- Workflow artifacts and logs: GitHub Actions run artifacts
