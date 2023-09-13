#!/bin/bash
set -e


# GITHUB_WORKFLOW_REF="A/B/.github/workflows/pull-reconfig.yml@refs/heads/develop"

TEMP_PART=$(echo "$GITHUB_WORKFLOW_REF" | awk -F "@" '{print $1}')

# Remove the prefix up to the last slash to get only the file path
WORKFLOW_FILE_PATH=$(echo "$TEMP_PART" | awk -F "/" '{for (i=2; i<=NF; ++i) printf $i (i==NF ? ORS : "/")}')
WORKFLOW_FILE_NAME=$(echo "$TEMP_PART" | awk -F "/" '{for (i=5; i<=NF; ++i) printf $i (i==NF ? ORS : "/")}')

echo "WORKFLOW_FILE_PATH=$WORKFLOW_FILE_PATH" >> $GITHUB_ENV
echo "WORKFLOW_FILE_NAME=$WORKFLOW_FILE_NAME" >> $GITHUB_ENV
