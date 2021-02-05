# sigma-to-elastalert
Ansible playbook to convert Sigma rules to ElastAlert rules

Takes in a directory of Sigma rules and reads through it recursively, and generates the ElastAlert rules.

## Use
* Modify paths to rules in `sigma-to-elastalert.sh` and `playbook.yml`
* Point to your own sigma config/backend files in `playbook.yml`
* Run 
  ```
  chmod +x sigma-to-elastalert.sh
  ./sigma-to-elastalert.sh
  ```
