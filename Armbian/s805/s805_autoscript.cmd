setenv env_addr "0x11400000"
setenv kernel_addr "0x14000000"
setenv initrd_addr "0x15000000"
setenv boot_start bootm ${kernel_addr} ${initrd_addr} ${dtb_addr}
if fatload mmc 0 ${kernel_addr} uImage; then if fatload mmc 0 ${initrd_addr} uInitrd; then if fatload mmc 0 ${env_addr} uEnv.ini; then env import -t ${env_addr} ${filesize};fi; if fatload mmc 0 ${dtb_addr} ${dtb_name}; then run boot_start; else store dtb read ${dtb_addr}; run boot_start;fi;fi;fi;
