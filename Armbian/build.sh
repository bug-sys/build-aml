#!/bin/bash
#set -x
Scripts=hasil
Sources=sources

mkdir -p $Scripts
mkimage -C none -A arm -T script -d $Sources/aml_autoscript.cmd $Scripts/aml_autoscript
mkimage -C none -A arm -T script -d $Sources/s805_autoscript.cmd $Scripts/s805_autoscript
mkimage -C none -A arm -T script -d $Sources/emmc_autoscript.cmd $Scripts/emmc_autoscript
echo "selesai"
