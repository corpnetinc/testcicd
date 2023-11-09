#!/usr/bin/env bash

INPUT_RUN=${INPUT_RUN:-$*}
exec bash -e -c "${INPUT_RUN//$'\n'/;}"
