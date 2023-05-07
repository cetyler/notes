#!/usr/bin/bash

# log_json.sh - git log to json format
# Requires jq (sudo apt install jq) and bat (sudo deb-get install bat)

git log --pretty=format:'%H%x00%an <%ae>%x00%ad%x00%s%x00' | \
              jq -R -s '[split("\n")[:-1] | map(split("\u0000")) | .[] | {
                "commit": .[0],
                "author": .[1],
                "date": .[2],
                "message": .[3]
                }]' | bat

