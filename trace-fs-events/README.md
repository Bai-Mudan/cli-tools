# traceFsEvents - a command to trace all filesystem actions of a linux process

Usage: `traceFsEvents <command>`

Example output:

```
./traceFsEvents touch x
Read: /etc/ld.so.cache
Read: /lib/x86_64-linux-gnu/libc.so.6
Read: /usr/lib/locale/locale-archive
Write: x

./traceFsEvents rm x
Read: /etc/ld.so.cache
Read: /lib/x86_64-linux-gnu/libc.so.6
Read: /usr/lib/locale/locale-archive
Delete: x
```