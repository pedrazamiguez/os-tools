#!/bin/bash

. "$(dirname "$0")/../../common/export-functions.sh"

echo "Files tasks..."
field=$(extract_field "a|b|c" "|" 3)
echo "$field"
echo "language: $language"
pause
