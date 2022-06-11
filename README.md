# clipboard-over-ssh
copy clipboard command from the remote clipboard (meant to be used with micro editor).
- This is not for real time syncing clipboard.
- This is meant to be used for terminal piping (not GUI session), mainly for micro text editor clipboard.
- Works by reading and writing file ~/.cache/clipboard-over-ssh/ssh-clipboard--((SSH CLIENT IP))

## How does it work?

`clipboard-over-ssh` needs to be installed to the remote PC.

Connect to remote ssh and copy something. (Copy by piping it to ssh-clipboard-set)

And then get it from remote to your terminal.

----

In case `ssh-clipboard-set`&`ssh-clipboard-get` is on remote:
``` shell
$ ssh remote 'echo something | ssh-clipboard-set'
$ ssh remote 'termux-clipboard-get'
something
```

In case `ssh-clipboard-set` is on remote<br>
and `ssh-connect-with-clipboard`&`ssh-get-from-connected-with-clipboard-fzf` in on client:
``` shell
$ ssh-connect-with-clipboard remote
(remote) $ echo something | ssh-clipboard-set

(( open new terminal ))
$ ssh-get-from-connected-with-clipboard-fzf
(( and choose 'remote' from fzf ))
something
```

## How to install?

with pacman:
``` shell
git clone https://github.com/denisde4ev/clipboard-over-ssh.git && cd clipboard-over-ssh
( cd ssh-client-path && makepkg -i )
makepkg -i
```

manually:
``` shell
git clone https://github.com/denisde4ev/clipboard-over-ssh.git && cd clipboard-over-ssh
cp -vi \
 ./ssh-clipboard-get \
 ./ssh-clipboard-set \
 ./ssh-connect-with-clipboard \
 ./ssh-get-from-connected-with-clipboard-fzf \
 -t /usr/local/bin/ \
;
```

manually with wget:
``` shell
cd /usr/local/bin/
for i in ssh-clipboard-get ssh-clipboard-set ssh-connect-with-clipboard ssh-get-from-connected-with-clipboard-fzf; do
 wget https://github.com/denisde4ev/clipboard-over-ssh/raw/master/"$i"
 chmod -v 755 ./"$i"
done
```



<br>
<br>

## note for micro editor integration:
This provides commands: `ssh-clipboard-get`/`ssh-clipboard-set` to integrate with micro text editor.<br>
This is NOT meant to be installed on Termux!
