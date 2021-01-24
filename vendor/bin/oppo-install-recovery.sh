#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/by-name/recovery:134217728:c561763c0054e9ed841ddf9df95a935f03b5cf23; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/by-name/boot:33554432:8703fb2277518a5adc4cd11ee98176fe0adcc192 \
          --target EMMC:/dev/block/by-name/recovery:134217728:c561763c0054e9ed841ddf9df95a935f03b5cf23 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
