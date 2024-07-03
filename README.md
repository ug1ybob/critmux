# critmux

Fork of [jpetazzo/critmux] which moves [tmux] state outside of container

By default the state lives in ``~/.config/critmux``

## Usage example

```
$ mkdir -p ~/bin
$ curl -LO --output-dir ~/bin https://raw.githubusercontent.com/ug1ybob/critmux/master/critmux
$ chmod +x ~/bin/critmux
$ critmux -h
usage: critmux [-h] [new-session [-s <sid>] | attach-session [-t <sid>] | kill-session [-t <sid>] | list-sessions]
```

[jpetazzo/critmux]: https://github.com/jpetazzo/critmux
[tmux]: http://tmux.sourceforge.net/ 
