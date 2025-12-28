#/bin/sh

MKBOOTIMG="$(pwd)/mkbootimg/mkbootimg.py"
OUT_KERNEL="$(pwd)/kernel/out/arch/arm64/boot/Image"
DTB_OUT="$(pwd)/kernel/out/arch/arm64/boot/dts/qcom/sdmmagpie.dtb"
CMDLINE="console=null androidboot.hardware=qcom androidboot.memcg=1 lpm_levels.sleep_disabled=1 video=vfb:640x400,bpp=32,memsize=3072000 msm_rtb.filter=0x237 service_locator.enable=1 swiotlb=1 androidboot.usbcontroller=a600000.dwc3 firmware_class.path=/vendor/firmware_mnt/image nokaslr printk.devkmsg=on loop.max_part=7"
BASE="0x00000000"
KOFFSET="0x00008000"
ROFFSET="0x02000000"
SECOFFSET="0x00000000"
DTBOFFSET="0x01f00000"
TAGSOFFSET="0x01e00000"
BOARD="SRPSF18B011"
PAGESZ="4096"
RAMDISK="$(pwd)/boot/ramdisk"
MONTH="$(date +%Y-%m)"

$MKBOOTIMG \
    --header_version 2 \
    --kernel "$OUT_KERNEL" \
    --ramdisk "$RAMDISK" \
    --dtb "$DTB_OUT" \
    --cmdline "$CMDLINE" \
    --base "$BASE" \
    --kernel_offset "$KOFFSET" \
    --ramdisk_offset "$ROFFSET" \
    --second_offset "$SECOFFSET" \
    --dtb_offset "$DTBOFFSET" \
    --tags_offset "$TAGSOFFSET" \
    --board "$BOARD" \
    --pagesize "$PAGESZ" \
    --os_version 16.0.0 \
    --os_patch_level "$MONTH" \
    --output boot.img

