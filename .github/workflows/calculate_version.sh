#!/bin/bash

# Check if a version file exists, if not, set initial version
if [ ! -f version.txt ]; then
  echo "0.1.0" > version.txt
fi

# Read the current version from the version file
CURRENT_VERSION=$(cat version.txt)

# Extract major, minor, and patch version numbers
IFS='.' read -r -a VERSION_PARTS <<< "$CURRENT_VERSION"
MAJOR=${VERSION_PARTS[0]}
MINOR=${VERSION_PARTS[1]}
PATCH=${VERSION_PARTS[2]}

# Determine which part of the version to increment
# You can adjust the logic here based on your versioning strategy
if [[ "$1" == "major" ]]; then
  ((MAJOR++))
  MINOR=0
  PATCH=0
elif [[ "$1" == "minor" ]]; then
  ((MINOR++))
  PATCH=0
else
  ((PATCH++))
fi

# Construct the next version
NEXT_VERSION="$MAJOR.$MINOR.$PATCH"

# Output the next version
echo "$NEXT_VERSION"

# Write the next version back to the version file
echo "$NEXT_VERSION" > version.txt
