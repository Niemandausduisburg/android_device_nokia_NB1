# Copyright (C) 2009 The Android Open Source Project
# Copyright (c) 2011, The Linux Foundation. All rights reserved.
# Copyright (C) 2017-2020 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import hashlib
import common
import re

def FullOTA_InstallBegin(info):
  AddVendorAssertion(info)
  return

def IncrementalOTA_InstallBegin(info):
  AddVendorAssertion(info)
  return

def AddVendorAssertion(info):
  info.script.AppendExtra('assert(nokia.file_exists("/dev/block/bootdevice/by-name/vendor_a") == "1" || \
                           abort("Error: Vendor partition doesn\'t exist! Please repartition your device before installing!"););')
  return
