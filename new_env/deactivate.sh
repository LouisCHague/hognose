#!/bin/bash
unset VIRTUAL_ENV
export PATH=$(echo "$PATH" | sed -e 's|:/mnt/c/Users/louis/hognose/new_env/bin||; s|^/mnt/c/Users/louis/hognose/new_env/bin:||; s|^/mnt/c/Users/louis/hognose/new_env/bin$||')
export PS1=$(echo "$PS1" | sed "s|(new_env) ||")
