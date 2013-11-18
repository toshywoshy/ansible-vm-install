#!/bin/bash

# Set the ramsizes
MINRAM={{ minram*1024 }}
RAMSIZE={{ ramsize*1024 }}

# Change memory to smaller ramsize
/bin/sed "s|<memory unit='KiB'>"$MINRAM"</memory>|<memory unit='KiB'>"$RAMSIZE"</memory>|" -i /etc/libvirt/qemu/{{ inventory_hostname }}.xml
/bin/sed "s|<currentMemory unit='KiB'>"$MINRAM"</currentMemory>|<currentMemory unit='KiB'>"$RAMSIZE"</currentMemory>|" -i /etc/libvirt/qemu/{{ inventory_hostname }}.xml

# Redefine VM
virsh define /etc/libvirt/qemu/{{ inventory_hostname }}.xml
