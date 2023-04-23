#!/usr/bin/env bash

ACTIONS_RUNNER_REMOVE_TOKEN=$(curl -sS --request POST --url "https://api.github.com/repos/${REPO_OWNER}/${REPO_NAME}/actions/runners/remove-token" --header "authorization: Bearer ${GITHUB_TOKEN}"  --header "content-type: application/json" | jq -r .token)
./config.sh remove --token $ACTIONS_RUNNER_REMOVE_TOKEN
