#!/bin/bash

"$(dirname "$0")/utils/setup.sh"
. "$(dirname "$0")/../common/export-functions.sh"

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

display_main_menu() {
    clear
    selected_option=$(
        dialog --stdout --no-cancel \
        --title " Mac tools (v0.2) " \
        --backtitle "Andrés Pedraza Míguez (pedraza.miguez@gmail.com)" \
        --menu "$(t "main_menu_connected_as_user") $(whoami)" 0 0 0 \
        1 "$(t "main_menu_option_admin")" \
        2 "$(t "main_menu_option_documents")" \
        3 "$(t "main_menu_option_downloads")" \
        4 "$(t "main_menu_option_files")" \
        5 "$(t "main_menu_option_images")" \
        9 "$(t "main_menu_option_language")" \
        0 "$(t "main_menu_option_exit")"
    )
    clear
    case $selected_option in
        1) launch_admin_tools;;
        2) "$(dirname "$0")/services/documents.sh";;
        3) "$(dirname "$0")/services/downloads.sh";;
        4) "$(dirname "$0")/services/files.sh";;
        5) "$(dirname "$0")/services/images.sh";;
        9) change_language; . "$(dirname "$0")/utils/common.sh";;
        0) exit 0;;
    esac
    pause
}

while [ true ]
do
    display_main_menu
done
