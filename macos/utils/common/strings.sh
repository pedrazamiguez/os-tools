#!/bin/bash

extract_field() {
    echo "$1" | cut -d "$2" -f $3
}
