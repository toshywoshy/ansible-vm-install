DEPRECIATED
Please use the new version available at
http://github.com/toshywoshy/ansible-role-vminstaller


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
    -   Debian 7 / Debian 6


### Usage ###

*   Set the mirrors to your local mirrors for better performance
*   Remember to fill in your own webserver to enable Debian post install scripts to run
*   For RHEL, use your own mirrored repository or mounted ISO to the variables


### TODO List ###
*   Add more distributions :
    -   Fedora
    -   Arch Linux
    -   Gentoo
    -   Ubuntu
    -   OpenBSD
    -   FreeBSD
    -   ...
*   Add hypervisors
*   Add more roles
*   Less scripting, more modules


### Authors ###

-   Toshaan Bharvani - <toshaan@vantosh.com> - (http://www.vantosh.com)
