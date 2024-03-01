# Proxmox VE Installation Guide

To get started, create a bootable USB and flash [Proxmox VE](https://www.proxmox.com/en/downloads) onto it.
I am using [Ventoy](https://www.ventoy.net).

## Installation

Boot from your USB drive and the Proxmox installer should start.

1. Click "Install Proxmox VE (Graphical)".
2. Accept the EULA.
3. Select the target device for OS installation, in my case a 128GB SSD that doesn't need to be redundant because of ansible.
4. Set the country, time zone and keyboard layout.
5. Enter the root password (password) and the email. Don't worry, the root password will be changed later using ansible.
6. Enter the hostname, ip address, gateway and DNS server.
7. Click "Install".
8. Reboot
9. Login

## Configuration

First update the packages on the system.

```shell
apt update
```

Now you can install `sudo`.

```shell
apt install sudo
```

### Adding the ansible user

To get started configuring the server using ansible, a user ansible can use needs to exist.

```shell
adduser ansible sudo
```

Make sure to enter the password "password" again. It can be changed later.

## Ansible

Head back to the [README.md](README.md#installing-ansible) file to continue the configuration.
