defenv
setenv bootcmd 'run start_autoscript; run storeboot;'
setenv start_autoscript 'if mmcinfo; then run start_mmc_autoscript; fi; run start_emmc_autoscript;'
setenv start_emmc_autoscript 'if fatload mmc 1 11000000 emmc_autoscript; then autoscr 11000000; fi;'
setenv start_mmc_autoscript 'if fatload mmc 0 11000000 s805_autoscript; then autoscr 11000000; fi;'
setenv upgrade_step '2'
saveenv
sleep 1
reboot
