# allowed-commands

Specify allowed commands in SSH authorized_keys file

## Usage

```bash
SSH_ORIGINAL_COMMAND="echo foo" ./allowed-commands.sh
# foo
SSH_ORIGINAL_COMMAND="echo bar" ./allowed-commands.sh
# bar
SSH_ORIGINAL_COMMAND="echo xx" ./allowed-commands.sh
# Forbidden
```

## Reference

Inspired by the following posts
[--1--](https://stackoverflow.com/a/402645/639133)
[--2--](https://serverfault.com/a/803873/279654)


