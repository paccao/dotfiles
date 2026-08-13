# Written guides on some useful operations

## Copy files from android device with MTP in the terminal

Connect device with USB. Make sure file transfer is enabled.

Every time you run a mtp-* command you have to reset the device, aka re-connect the usb device and enable file transfer

1. Run `mtp-detect` to find your device
1. Run `mtp-files | grep -B 1 -A 4 kdbx` to find keepassxc files on your phone device. Note the File ID.
1. Run `mtp-getfile <File ID> </localhost/file/path/priv.kdbx>
1. Run `mtp-sendfile <local filename> <remote filename>` to send a file to your phone device

