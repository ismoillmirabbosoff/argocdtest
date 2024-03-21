#!/bin/bash

# Check if a version file exists, if not, set initial version
if [ ! -f version.txt ]; then
  echo "0.0.0" > version.txt
fi

# Read the current version from the version file
CURRENT_VERSION=$(cat version.txt)

# Increment the version by one
NEXT_VERSION=$(awk -F. '{print $1"."$2"."$3+1}' <<< "$CURRENT_VERSION")

# Output the next version
echo "$NEXT_VERSION"


# Write the next version back to the version file
echo "$NEXT_VERSION" > version.txt
