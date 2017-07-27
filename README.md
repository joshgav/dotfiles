## Add to local ~/.bashrc:

```
if [ -f ~/meta/dotfiles/.bashrc ]; then . ~/meta/dotfiles/.bashrc; fi
```

## Add to local ~/.vimrc:

```
if !empty($SHARED_VIMRC) | source $SHARED_VIMRC | endif
```

## Add to local ~/.tmux.conf

```
source-file ~/meta/dotfiles/.tmux.conf
