#!/bin/bash

subsite="$1"

port="$2"

image="$3"

extra=" $4 "

docker run --name "${subsite}_${port}" -idt -p ${port}:80 ${extra} ${image}