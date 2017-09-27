# AnyKernel2 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() {
kernel.string=Clark-Simple-Kernel by cmulk
do.devicecheck=1
do.modules=0
do.cleanup=1
do.cleanuponabort=1
device.name1=clark
device.name2=
device.name3=
device.name4=
device.name5=
} # end properties

# shell variables
block=/dev/block/platform/soc.0/f9824900.sdhci/by-name/boot;
is_slot_device=0;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. /tmp/anykernel/tools/ak2-core.sh;


## AnyKernel permissions
# set permissions for included ramdisk files
chmod -R 755 $ramdisk


## AnyKernel install
dump_boot;

# begin ramdisk changes

# init.rc
backup_file init.rc;
insert_line init.rc "init.customgov.rc" after "import /init.usb.configfs.rc" "import /init.customgov.rc";
# end ramdisk changes


write_boot;

## end install

