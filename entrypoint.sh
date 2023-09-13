#!/bin/bash
set -e

# Split the string based on "@" symbol and take the first part
TEMP_PART=$(echo "$GITHUB_WORKFLOW_REF" | awk -F "@" '{print $1}')

# Remove the prefix up to the last slash to get only the file path
WORKFLOW_FILE_PATH=$(echo "$TEMP_PART" | awk -F "/" '{for (i=4; i<=NF; ++i) printf $i (i==NF ? ORS : "/")}')
echo "WORKFLOW_FILE_PATH=$WORKFLOW_FILE_PATH" >> $GITHUB_ENV

env | sort -n
