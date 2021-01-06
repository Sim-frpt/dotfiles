#!/bin/bash

function change_setting {
  schema=$1
  key=$2
  value=$3
  writable=$(gsettings writable $schema $key)
  if [ $? -eq 0 ] && [ $writable == true ]; then
    echo "Changing '${schema}' '${key}' to '${value}'"
    gsettings set $schema $key "$value"
  else
    echo "ERROR: could not set ${schema} ${key} to ${value}"
  fi
}
