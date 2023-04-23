#!/usr/bin/env bash

GH_RUNNER_VERSION_LABEL=$(curl -s -X GET 'https://api.github.com/repos/actions/runner/releases/latest' | jq -r '.tag_name')
GH_RUNNER_VERSION=$(echo "${GH_RUNNER_VERSION_LABEL:1}")
curl -o actions.tar.gz --location "https://github.com/actions/runner/releases/download/v${GH_RUNNER_VERSION}/actions-runner-linux-x64-${GH_RUNNER_VERSION}.tar.gz"
tar -zxf actions.tar.gz
rm -f actions.tar.gz
./bin/installdependencies.sh
