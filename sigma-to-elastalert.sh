#!/bin/bash

# get all sigma rules
find path/to/sigma/rules -name "*.yml" > /tmp/rules.txt

# iterate over rules
while read line; do

    # parse out all fields: path/to/sigma/rules/windows/builtin/win_susp_psexec.yml
    rule_path="$(echo $line)" # path/to/sigma/rules/windows/builtin/win_susp_psexec.yml
    rule_cat="$(echo $line | cut -d'/' -f 5)" # windows
    rule_dir="$(echo $line | cut -d'/' -f 6)" # builtin
    rule_name="$(echo $line | cut -d'/' -f 7)" # win_susp_psexec.yml

    # generate elastalert rules
    ansible-playbook playbook.yml -e "rule_path=$rule_path rule_cat=$rule_cat rule_dir=$rule_dir rule_name=$rule_name" -vvvv

done < /tmp/rules.txt

# cleanup
rm /tmp/rules.txt
