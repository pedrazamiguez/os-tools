#!/bin/bash

# SCRIPTS TO EXPORT *****************************************************************************************
SCRIPTS_TO_EXPORT="translation io permissions strings"
# ***********************************************************************************************************

PATH_DELIMITER="/os-tools"
FUNCTIONS_PATH="/common/functions"
base_path=$(echo "$(realpath "$0")" | awk -F "$PATH_DELIMITER" '{ print $1 }')
full_path="${base_path}${PATH_DELIMITER}${FUNCTIONS_PATH}"

for script in $SCRIPTS_TO_EXPORT
do
    full_script_path="${full_path}/${script}.sh"
    # Source script
    . "$full_script_path"
    # Export functions
    function_names=$(cat "$full_script_path" | grep "() {" | cut -d "(" -f 1)
    #echo "$function_names"
    export -f $function_names
done

export language
