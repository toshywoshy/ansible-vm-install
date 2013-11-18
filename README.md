ansible-vm-install
==================

Ansible VM Install Playbooks

This is a collection of playbooks to install virtual machines on hypervisors supported through libvirt.
The host file contains the information for building the vm


### Dependencies ###

*   Ansible (on the management node)
*   Libvirt with python modules including the virt-install tool
*   Acces to the Linux Distribution Repositories (on the hypervisor)


### Tested / Supported ###

*   Hypervisors
    -   kvm
*   Distribution
    -   RHEL6 / CentOS 6 / Scientific 6


### TODO List ###
*   Add more distributions :
    -   Fedora
    -   Arch Linux
    -   Gentoo
    -   Debian
    -   Ubuntu
    -   OpenBSD
    -   FreeBSD
    -   ...
*   Add hypervisors
*   Add more roles
*   Less scripting, more modules


### Author ###

-   Toshaan Bharvani - <toshaan@vantosh.com> - (http://www.vantosh.com)
