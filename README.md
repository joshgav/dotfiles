## Add to local ~/.bashrc:

```
if [ -f $HOME/src/dotfiles/.bashrc ]; then . $HOME/src/dotfiles/.bashrc; fi
```

## Add to local ~/.vimrc:

```
if !empty($SHARED_VIMRC) | source $SHARED_VIMRC | endif
```

## Add to local ~/.tmux.conf

```
source-file ~/src/dotfiles/.tmux.conf
```
