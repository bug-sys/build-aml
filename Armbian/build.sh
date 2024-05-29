#!/bin/bash
#set -x

# Memproses jenis chipset/SoC yang ingin dibuat
echo -e "\e[33mPilih jenis chipset/SoC yang ingin Anda buat (s805/s905):\e[0m"
read jenis

# Membuat direktori untuk menyimpan hasil
HASIL=hasil
mkdir -p $HASIL

# Melakukan pemrosesan berdasarkan pilihan pengguna
case "$jenis" in
    s805)
        CHIPSET=s805
        ;;
    s905)
        CHIPSET=s905
        ;;
    *)
        echo -e "\e[31mPilihan tidak valid. Silakan pilih antara 's805' atau 's905'.\e[0m" 
        exit 1
        ;;
esac

# Menjalankan perintah mkimage untuk chipset yang dipilih
process_chipset() {
    local script="$1"
    echo -e "\e[34mMemproses file $script...\e[0m" 
    if mkimage -C none -A arm -T script -d "$CHIPSET/$script.cmd" "$HASIL/$script" >/dev/null 2>&1; then
        echo -e "\e[32mSelesai\e[0m"
    else
        echo -e "\e[31mGagal memproses $script\e[0m"
        exit 1
    fi
}

process_chipset "aml_autoscript"
process_chipset "${CHIPSET}_autoscript"
process_chipset "emmc_autoscript"

echo -e "\e[32mSEMUA PROSES SUDAH SELESAI !!!\e[0m"
