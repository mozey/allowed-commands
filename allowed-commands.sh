#!/usr/bin/env bash
CMD_FOO="echo foo"
CMD_BAR="echo bar"

case "$SSH_ORIGINAL_COMMAND" in
    "$CMD_FOO")
        $CMD_FOO
        ;;
    "$CMD_BAR")
        $CMD_BAR
        ;;
    *)
        echo "Forbidden"
        exit 1
        ;;
esac
