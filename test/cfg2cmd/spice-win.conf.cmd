/usr/bin/kvm \
  -id 8006 \
  -name 'spiceusb3,debug-threads=on' \
  -no-shutdown \
  -chardev 'socket,id=qmp,path=/var/run/qemu-server/8006.qmp,server=on,wait=off' \
  -mon 'chardev=qmp,mode=control' \
  -chardev 'socket,id=qmp-event,path=/var/run/qmeventd.sock,reconnect=5' \
  -mon 'chardev=qmp-event,mode=control' \
  -pidfile /var/run/qemu-server/8006.pid \
  -daemonize \
  -smbios 'type=1,uuid=7b10d7af-b932-4c66-b2c3-3996152ec461' \
  -smp '2,sockets=1,cores=2,maxcpus=2' \
  -nodefaults \
  -boot 'menu=on,strict=on,reboot-timeout=1000,splash=/usr/share/qemu-server/bootsplash.jpg' \
  -vnc 'unix:/var/run/qemu-server/8006.vnc,password=on' \
  -no-hpet \
  -cpu 'kvm64,enforce,hv_ipi,hv_relaxed,hv_reset,hv_runtime,hv_spinlocks=0x1fff,hv_stimer,hv_synic,hv_time,hv_vapic,hv_vpindex,+kvm_pv_eoi,+kvm_pv_unhalt,+lahf_lm,+sep' \
  -m 768 \
  -device 'pci-bridge,id=pci.1,chassis_nr=1,bus=pci.0,addr=0x1e' \
  -device 'pci-bridge,id=pci.2,chassis_nr=2,bus=pci.0,addr=0x1f' \
  -device 'vmgenid,guid=c773c261-d800-4348-9f5d-167fadd53cf7' \
  -device 'piix3-usb-uhci,id=uhci,bus=pci.0,addr=0x1.0x2' \
  -device 'nec-usb-xhci,id=xhci,bus=pci.1,addr=0x1b' \
  -chardev 'spicevmc,id=usbredirchardev1,name=usbredir' \
  -device 'usb-redir,chardev=usbredirchardev1,id=usbredirdev1,bus=xhci.0' \
  -device 'qxl-vga,id=vga,bus=pci.0,addr=0x2' \
  -device 'qxl,id=vga1,ram_size=67108864,vram_size=33554432,bus=pci.0,addr=0x18' \
  -device 'virtio-serial,id=spice,bus=pci.0,addr=0x9' \
  -chardev 'spicevmc,id=vdagent,name=vdagent' \
  -device 'virtserialport,chardev=vdagent,name=com.redhat.spice.0' \
  -spice 'tls-port=61000,addr=127.0.0.1,tls-ciphers=HIGH,seamless-migration=on' \
  -device 'virtio-balloon-pci,id=balloon0,bus=pci.0,addr=0x3' \
  -iscsi 'initiator-name=iqn.1993-08.org.debian:01:aabbccddeeff' \
  -netdev 'type=tap,id=net0,ifname=tap8006i0,script=/var/lib/qemu-server/pve-bridge,downscript=/var/lib/qemu-server/pve-bridgedown,vhost=on' \
  -device 'virtio-net-pci,mac=A2:C0:43:77:08:A1,netdev=net0,bus=pci.0,addr=0x12,id=net0,bootindex=300' \
  -rtc 'driftfix=slew,base=localtime' \
  -machine 'type=pc-i440fx-4.0' \
  -global 'kvm-pit.lost_tick_policy=discard'
