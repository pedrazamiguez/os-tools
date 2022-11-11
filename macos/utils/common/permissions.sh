#!/bin/bash

print_access_not_granted() {
    dialog --title " Access not granted " --infobox "You need to have administrator privileges to run these tasks." 4 50
}

exit_if_no_admin() {
    if [[ $EUID > 0 ]]
    then
        print_access_not_granted
        exit 1
    fi
}
