#!/usr/bin/bash
set -ex

if [ "$(id -u)" -ne 0 ]; then
    echo -e 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
    exit 1
fi

yum install -y gcc gcc-c++ gdb cmake ninja-build make git
