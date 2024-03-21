#!/bin/bash

# Get the latest version tag
latest_tag=$(git describe --abbrev=0 --tags)

# Extract major, minor, and patch versions from the latest tag
major=$(echo "$latest_tag" | cut -d '.' -f 1)
minor=$(echo "$latest_tag" | cut -d '.' -f 2)
patch=$(echo "$latest_tag" | cut -d '.' -f 3)

# Initialize version increment variables
increment_major=false
increment_minor=false
increment_patch=false

# Check commit messages for version increments
while read -r line; do
    case "$line" in
        *'BREAKING CHANGE:'*)
            increment_major=true
            ;;
        *'feat:'*)
            increment_minor=true
            ;;
        *'fix:'*)
            increment_patch=true
            ;;
        *)
            ;;
    esac
done < <(git log --format=%s ${latest_tag}..HEAD)

# Increment version
if [ "$increment_major" = true ]; then
    major=$((major + 1))
    minor=0
    patch=0
elif [ "$increment_minor" = true ]; then
    minor=$((minor + 1))
    patch=0
elif [ "$increment_patch" = true ]; then
    patch=$((patch + 1))
fi

# Output the new version
echo "${major}.${minor}.${patch}"