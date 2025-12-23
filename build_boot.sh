#/bin/sh

APK_URL="$(curl -s "https://api.github.com/repos/topjohnwu/Magisk/releases/latest" | grep -oE 'https://[^\"]+\.apk' | grep app-debug)"
wget -O "magisk.zip" "$APK_URL"
unzip "magisk.zip" "lib/x86_64/libmagiskboot.so"
sudo cp "lib/x86_64/libmagiskboot.so" "/usr/bin/magiskboot"
sudo chmod +x "/usr/bin/magiskboot"

magiskboot unpack ../boot.img
cp ../kernel/out/arch/arm64/boot/Image kernel
cp ../kernel/out/arch/arm64/boot/dts/qcom/sdmmagpie.dtb dtb
magiskboot repack ../boot.img boot-new.img
mv boot-new.img ../boot.img
