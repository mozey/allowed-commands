# allowed-commands

Specify allowed commands in SSH authorized_keys file


## Usage

Copy the scripts to `~/.ssh`
```bash
cp allowed-commands.sh ~/.ssh/
cp allowed-commands.env ~/.ssh/
```

Specify regular expressions to match allowed commands
```bash
vi ~/.ssh/allowed-commands.env
```

Edit `~/.ssh/authorized_keys`

Prepend key to restrict with `command="/path/to/.ssh/allowed-commands.sh" `


## Testing

```bash
SSH_ORIGINAL_COMMAND="ls -la" ./allowed-commands.sh
# ...
SSH_ORIGINAL_COMMAND="ls -la && pwd" ./allowed-commands.sh
# ls: &&: No such file or directory
# ls: pwd: No such file or directory
SSH_ORIGINAL_COMMAND="ls -la; pwd" ./allowed-commands.sh
# ls: illegal option -- ;
SSH_ORIGINAL_COMMAND="ls" ./allowed-commands.sh
# Forbidden
SSH_ORIGINAL_COMMAND="pwd" ./allowed-commands.sh
# Forbidden
```


## Reference

Inspired by the following posts
- [Managing SSH for Scripts...](https://www.linuxjournal.com/article/8257)
- [How to restrict SSH users to a predefined set of commands after login?](https://stackoverflow.com/a/402645/639133)
- [SSH authorized_keys command option: multiple commands?](https://serverfault.com/a/803873/279654)


