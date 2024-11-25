#!/bin/bash

subsite="$1"

port="$2"

docker stop "${subsite}_${port}"

docker remove "${subsite}_${port}"
