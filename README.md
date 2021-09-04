# allowed-commands

Specify allowed commands in SSH authorized_keys file

## Usage

```bash
SSH_ORIGINAL_COMMAND="ls -lah && pwd" ./allowed-commands.sh
# ls: &&: No such file or directory
# ls: pwd: No such file or directory
SSH_ORIGINAL_COMMAND="ls -lah; pwd" ./allowed-commands.sh
# ls: illegal option -- ;
SSH_ORIGINAL_COMMAND="pwd" ./allowed-commands.sh
# Forbidden
```

## Reference

Inspired by the following posts
- [--1--](https://stackoverflow.com/a/402645/639133)
- [--2--](https://serverfault.com/a/803873/279654)


