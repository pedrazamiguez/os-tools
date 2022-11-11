#!/bin/bash

. "$(dirname "$0")/../utils/common.sh"
echo "Files tasks..."
field=$(extract_field "a|b|c" "|" 3)
echo "$field"
