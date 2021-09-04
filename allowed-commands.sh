#!/usr/bin/env bash

set -u # exit on undefined variable
SSH_ORIGINAL_COMMAND=${SSH_ORIGINAL_COMMAND}

# These are the allowed commands
# shellcheck disable=SC1091
source allowed-commands.env

# CMD="no match"

for (( i = 0 ; i < ${#ALLOWED_COMMANDS[@]} ; i = i + 1 )) do
    REGEX=${ALLOWED_COMMANDS[$i]}
    if [[ $SSH_ORIGINAL_COMMAND =~ ${REGEX} ]] 
    then
        $SSH_ORIGINAL_COMMAND
        exit $?
    fi
done

echo "Forbidden"
exit 1
