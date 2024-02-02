# Servy

This is my ansible repository for managing my homeserver Servy.

## Installation

The configuration assumes, that the server is setup with the user `ansible` and the ip address `192.168.5.10`.

### Installing Ansible

Follow  the [official installation guide](https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html) to install ansible on your system.
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

### Running the Ansible playbook

After testing your connection, you can run the ansible playbook to bring the server back to state.

```shell
ansible-playbook run.yml -K --ask-vault-pass
```

You may omit `-K` if passwordless sudo is enabled on the server.