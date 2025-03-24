#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: 2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

from extract_utils.fixups_blob import (
    blob_fixup,
    blob_fixups_user_type,
)
from extract_utils.fixups_lib import (
    lib_fixup_remove,
    lib_fixups,
    lib_fixups_user_type,
)
from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

import extract_utils.tools
extract_utils.tools.DEFAULT_PATCHELF_VERSION = '0_9'

namespace_imports = [
    'device/nokia/NLA',
    'hardware/qcom-caf/msm8998',
    'vendor/nokia/msm8998-common',
]

blob_fixups: blob_fixups_user_type = {
    # Load sensors.rangefinder.so from /vendor partition
    'vendor/lib/libmmcamera2_stats_modules.so': blob_fixup()
	.binary_regex_replace(b'system/lib64/sensors.rangefinder.so', b'vendor/lib64/sensors.rangefinder.so')
	.binary_regex_replace(b'system/lib/sensors.rangefinder.so', b'vendor/lib/sensors.rangefinder.so'),
    ('vendor/lib/libmmcamera_faceproc.so', 'vendor/lib/libmmcamera_faceproc2.so'): blob_fixup()
        .clear_symbol_version('__aeabi_memcpy')
        .clear_symbol_version('__aeabi_memset')
        .clear_symbol_version('__gnu_Unwind_Find_exidx'),
    'vendor/lib/libmmcamera_tuning.so': blob_fixup()
	.remove_needed('libmm-qcamera.so'),
    # Patch gx_fpd for VNDK support
    'vendor/bin/gx_fpd': blob_fixup()
	.patchelf_version('0_18')
	.remove_needed('libunwind.so')
	.remove_needed('libbacktrace.so')
	.add_needed('liblog.so')
	.add_needed('libbinder_shim.so')
	.add_needed('libfakelogprint.so')
	.replace_needed('libstdc++.so', 'libstdc++_vendor.so'),
    'vendor/lib64/hw/fingerprint.msm8998.so': blob_fixup()
        .patchelf_version('0_18')
        .add_needed('libfakelogprint.so')
        .replace_needed('libstdc++.so', 'libstdc++_vendor.so'),
    'vendor/lib64/libfp_client.so': blob_fixup()
        .patchelf_version('0_18')
	.add_needed('liblog.so')
        .replace_needed('libstdc++.so', 'libstdc++_vendor.so'),
    'vendor/lib64/libfpservice.so': blob_fixup()
        .patchelf_version('0_18')
        .add_needed('libbinder_shim.so')
        .add_needed('liblog.so')
	.replace_needed('libstdc++.so', 'libstdc++_vendor.so'),
    # Hexedit gxfingerprint to load Goodix firmware from /vendor/firmware/
    'vendor/lib64/hw/gxfingerprint.default.so': blob_fixup()
        .patchelf_version('0_18')
        .add_needed('libfakelogprint.so')
        .binary_regex_replace(b'/system/etc/firmware', b'/vendor/firmware\x00\x00\x00\x00')
	.replace_needed('libstdc++.so', 'libstdc++_vendor.so'),
}  # fmt: skip

module = ExtractUtilsModule(
    'NLA',
    'nokia',
    blob_fixups=blob_fixups,
    lib_fixups=lib_fixups,
    namespace_imports=namespace_imports,
    add_firmware_proprietary_file=True,
)

if __name__ == '__main__':
    utils = ExtractUtils.device_with_common(
        module, 'msm8998-common', module.vendor
    )
    utils.run()
