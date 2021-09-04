#!/usr/bin/env bash
set -eu                   # exit on error or undefined variable
bash -c 'set -o pipefail' # return code of first cmd to fail in a pipeline

# Script fails if vars are not set in env
SSH_ORIGINAL_COMMAND=${SSH_ORIGINAL_COMMAND}

# These are the allowed commands
CMD_FOO="^echo f.*$"
CMD_BAR="^echo b.*$"

CMD="no match"

# Regex match
# https://stackoverflow.com/a/21112809/639133
[[ $SSH_ORIGINAL_COMMAND =~ ${CMD_FOO} ]] && CMD=${CMD_FOO}
[[ $SSH_ORIGINAL_COMMAND =~ ${CMD_BAR} ]] && CMD=${CMD_BAR}

# Run allowed command
case "$CMD" in
    "$CMD_FOO")
        $SSH_ORIGINAL_COMMAND
        ;;
    "$CMD_BAR")
        $SSH_ORIGINAL_COMMAND
        ;;
    *)
        echo "Forbidden"
        exit 1
        ;;
esac
