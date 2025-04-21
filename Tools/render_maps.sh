#!/bin/bash

set -e
git fetch origin master
changed_files=$(git diff --name-only origin/master...HEAD)

for file in $changed_files; do
    if [[ "$file" == Resources/Maps/* ]]; then
        dotnet run --project Content.MapRenderer --no-build -- -f Resources/Maps/Dungeon/experiment.yml
    fi
done
