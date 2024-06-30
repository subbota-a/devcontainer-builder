#!/usr/bin/bash
set -ex

if [ "$(id -u)" -ne 0 ]; then
    echo -e 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
    exit 1
fi

if [ $# -ne 3 ]; then
    echo -e 'Expected username, user_id, user_group_id parameters'
    exit 1
fi
USERNAME=$1
USER_UID=$2
USER_GID=$3

# Create or update a non-root user to match UID/GID.
group_name="${USERNAME}"
if [ "$USERNAME" != "root" ]; then
    groupadd --gid $USER_GID $USERNAME
    useradd -s /bin/bash --uid $USER_UID --gid $USERNAME -m $USERNAME
    yes ${USERNAME} | passwd ${USERNAME}
    echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME
    chmod 0440 /etc/sudoers.d/$USERNAME
fi
