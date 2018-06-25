#!/usr/bin/env bash
here=$(readlink -f $PWD)
script=$(readlink -f $BASH_SOURCE)
script_dir=$(dirname $script)

export VIRTUAL_ENV=$script_dir/venv
[[ -d $VIRTUAL_ENV ]] || python3.6 -m venv $VIRTUAL_ENV

export PATH=$VIRTUAL_ENV/bin:$PATH
which pip3.6 || exit

pip3.6 install --upgrade pip
#pip3.6 install <stuff>


