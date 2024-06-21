# Servy

This is my ansible repository for managing my homeserver Servy.

## Installation

The configuration assumes, that the server is setup with the user `ansible` and the ip address `192.168.5.10`.
If your server uses a different ip address, make sure to change it in the `hosts` file.
You can read the [setup instructions for my proxmox server](PROXMOX.md) to get started.

### Installing Ansible

Follow the [official installation guide](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) to install ansible on your system. I installed Ansible using pip to get the latest version.
Afterwards, clone the repository to a directory of your choice.

```shell
git clone https://github.com/Quadrubo/servy
```

### Installing the Ansible Galaxy dependencies

```shell
ansible-galaxy install -r requirements.yml
```

### Creating the SSH key

Start of by creating the SSH key for the server. To do that, run `ssh-keygen -f ./.ssh/servy`. Then use `ssh-copy-id -i ./.ssh/servy ansible@192.168.5.10` to copy that key to the server.

Test if everything worked as expected by connecting to the server with `ssh -i ./.ssh/servy ansible@192.168.5.10`.

### Testing the Ansible connection

Once you tested that you can connect to the server yourself, test if ansible can connect to the server using the following command.

```shell
ansible all -m ping --ask-vault-pass
```

### Filling in the variables

Copy the example variable files `group_vars.example` to the `group_vars` folder.

```shell
cp -r group_vars.example group_vars
```

Afterwards fill all necessary variables.

#### Identifying the ids to use for the zfs pool

First list all devices attached to the computer with `lsblk -l`.
Identify the ones which should be in the pool. For example: `sda`

Now list the devices by id with the command `ls -la /dev/disk/by-id/ | grep sda`. You should pick the device that points to the root of the disk (sda not sda1) and starts with `ata`.

You can find out the sector size by using `sudo fdisk -l /dev/sda` on the disks. `2^ashift` should be your physical sector size.
For a physical sector size of `4096 bytes` it should be `12` because `2^12=4096`.

### Running the Ansible playbook

After testing your connection, you can run the ansible playbook to bring the server back to state.

```shell
docker compose run --rm ansible ansible-playbook run.yml -K --ask-vault-pass
```

You may omit `-K` if passwordless sudo is enabled on the server.
