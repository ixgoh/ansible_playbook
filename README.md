# ansible_playbook

## Usage
1. Install Ansible.
    ```bash
    sudo apt update && sudo apt install -y python3-pip sshpass
    pip3 install ansible
    export PATH=$PATH:$HOME/.local/bin
    ```

2. Modify packages / tools to be configured in [main.ansible.yml](main.ansible.yml).

3. Modify [inventory](inventory) file with hosts information.
    > Remove `ansible_ssh_common_args='-o StrictHostKeyChecking=no'` to enable host key matching.

4. Install required dependencies.
    ```bash
    ansible-galaxy install -r requirements.yml
    ```

5. Execute Ansible script.
    ```bash 
    ansible-playbook -i inventory main.ansible.yml
    ```
