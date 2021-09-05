#!/usr/bin/env bash

set -u # exit on undefined variable
SSH_ORIGINAL_COMMAND=${SSH_ORIGINAL_COMMAND}

# These are the allowed commands
# shellcheck disable=SC1091
source "${HOME}"/.ssh/allowed-commands.env

for (( i = 0 ; i < ${#ALLOWED_COMMANDS[@]} ; i = i + 1 )) do
    REGEX=${ALLOWED_COMMANDS[$i]}
    if [[ $SSH_ORIGINAL_COMMAND =~ ${REGEX} ]] 
    then
        # Assuming bash will only execute the first command in the string
        # TODO See this https://unix.stackexchange.com/a/444949/309572
        $SSH_ORIGINAL_COMMAND
        exit $?
    fi
done

echo "Forbidden"
exit 1
