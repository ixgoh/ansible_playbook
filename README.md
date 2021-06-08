# ansible_playbook

My playbook to automate the setting up of Docker on Linux-based machines.

## Usage

1. Make a copy of `hosts` file from template.
    ```bash
    cp hosts.example hosts
    ```
2. Modify the details in the `hosts` file.
    ```bash
    nano hosts
    ```
3. Run the playbook.
    ```bash
    ansible-playbook server.yml
    ```