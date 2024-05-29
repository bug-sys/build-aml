#!/bin/bash
#set -x
Scripts=hasil
Sources=sources
ResultFolder=result

mkdir -p $Scripts
mkdir -p $ResultFolder

echo "Pilih jenis script yang ingin dibuat:"
echo "1. s805_autoscript"
echo "2. s905_autoscript"
read -p "Masukkan pilihan (1 atau 2): " choice

case $choice in
    1)
        script_name="s805_autoscript"
        ;;
    2)
        script_name="s905_autoscript"
        ;;
    *)
        echo "Pilihan tidak valid. Keluar."
        exit 1
        ;;
esac

mkimage -C none -A arm -T script -d $Sources/aml_autoscript.cmd $Scripts/aml_autoscript
mkimage -C none -A arm -T script -d $Sources/"$script_name".cmd $Scripts/"$script_name"
mkimage -C none -A arm -T script -d $Sources/emmc_autoscript.cmd $Scripts/emmc_autoscript

mv $Scripts/* $ResultFolder  # Pindahkan semua file ke folder hasil

echo "selesai"
