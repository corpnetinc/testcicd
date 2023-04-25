#!/usr/bin/env bash

# shellcheck disable=SC2034
ACTIONS_RUNNER_INPUT_URL="https://github.com/${REPO_OWNER}/${REPO_NAME}"
ACTIONS_RUNNER_INPUT_NAME=$HOSTNAME
ACTIONS_RUNNER_INPUT_TOKEN="$(curl -sS --request POST --url "https://api.github.com/repos/${REPO_OWNER}/${REPO_NAME}/actions/runners/registration-token" --header "authorization: Bearer ${GITHUB_TOKEN}"  --header 'content-type: application/json' | jq -r .token)"
/runner/config.sh --unattended --replace --work "/tmp" --url "$ACTIONS_RUNNER_INPUT_URL" --token "$ACTIONS_RUNNER_INPUT_TOKEN" --labels "$RUNNER_LABELS"
/runner/bin/runsvc.sh
