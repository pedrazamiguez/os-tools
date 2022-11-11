#!/bin/bash

PATH_DELIMITER_T="/os-tools/macos"
LANGUAGE_PATH="/i18n"
base_path_t=$(echo "$(realpath "$0")" | awk -F "$PATH_DELIMITER_T" '{ print $1 }')
full_path_t="${base_path_t}${PATH_DELIMITER_T}${LANGUAGE_PATH}"

if [ -z $language ]
then
    language="en"
fi

language_file_path="${full_path_t}/${language}.csv"

t() {
    echo "$(cat "$language_file_path" | grep -w "$1" | cut -d ";" -f 2)"
}

change_language() {
    language=$(
        dialog --stdout --no-cancel --radiolist \
        "$(t "language_title")" 0 0 0 \
        "en" "$(t "language_english")" $([ "en" = "$language" ] && echo ON || echo OFF) \
        "es" "$(t "language_spanish")" $([ "es" = "$language" ] && echo ON || echo OFF)
    )
}
