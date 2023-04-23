#!/usr/bin/env bash

RUNNER_ID="$(cat /runner/.runner | jq .agentId)"

RUNNER_STATUS=$(curl \
                  -sS \
                  --request GET \
                  --url "https://api.github.com/repos/${REPO_OWNER}/${REPO_NAME}/actions/runners/${RUNNER_ID}" \
                  --header "authorization: Bearer ${GITHUB_TOKEN}" \
                  --header 'content-type: application/json' | jq -r .status)

if [ "${RUNNER_STATUS}" != "online" ]; then
    echo "Runner is offline!"
    exit 1
fi

exit 0
