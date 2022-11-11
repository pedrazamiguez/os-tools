#!/bin/bash

launch_admin_tools() {
    admin_script_path="$(dirname "$(realpath "$0")")/services/admin.sh"
    osa_command="do shell script \"${admin_script_path}\" with administrator privileges"
    osascript -e "$osa_command" -s o
    response=$?
    if [[ $response > 0 ]]
    then
        print_access_not_granted
    fi
}
