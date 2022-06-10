#!/bin/bash
set -euo pipefail

export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

sudo -l | tail -2

if ! which brew &>/dev/null; then
    $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)
fi

if ! which ansible &>/dev/null; then
    brew install -q ansible
fi

ansible-galaxy install -r requirements.yml
ansible-playbook main.yml
