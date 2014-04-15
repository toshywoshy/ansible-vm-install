#!/bin/bash

if [ ! -f /etc/libvirt/qemu/{{ inventory_hostname }}.xml ]; then

virt-install \
    --name={{ inventory_hostname }} \
    --vcpus={{ virtualcpus }} \
{% if minram is defined and ramsize < minram %}
    --ram={{ minram }} \
{% else %}
    --ram={{ ramsize }} \
{% endif %}
    --hvm \
    --accelerate \
    --os-variant={{ distrotype }} \
{% for disk in disks %}
    {% if disk.size[-1:] == 'T' %}
        {% set disk_size = (disk.size[:-1]|float) * 1024 %}
    {% elif disk.size[-1:] == 'G' %}
        {% set disk_size = (disk.size[:-1]|float) %}
    {% elif disk.size[-1:] == 'M' %}
        {% set disk_size = (disk.size[:-1]|float) / 1024 %}
    {% elif disk.size[-1:] == 'K' %}
        {% set disk_size = (disk.size[:-1]|float) / 1024 / 1024 %}
    {% else %}
        {% set disk_size = (disk.size[:-1]|float) %}
    {% endif %}
    --disk path={{ disk.path }},device=disk,size={{ disk_size }},cache=writeback,format=qcow2,io=threads,bus=virtio \
{% endfor %}
{% for nic in nics %}
    --network {{ nic.type }}={{ nic.name }},model={{ nic.model }} \
{% endfor %}
    --location={{ location }} \
    --initrd-inject={{ virtualfilespath }}{{ injectfile }} \
{% if graphics is defined %}
    --extra-args "{{ gextrargs }}" \
{% else %}
    --extra-args "{{ textrargs }}" \
{% endif %}
    --memballoon virtio \
{% if graphics is defined %}
    --graphics {{ graphics.type }},port={{ graphics.port }} \
{% else %}
    --nographics \
{% endif %}
    --noautoconsole

else

echo "Already active"

fi
