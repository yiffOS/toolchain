#!/bin/bash

chroot "$1"   /usr/bin/env -i      \
    HOME=/root                     \
    TERM="$TERM"                   \
    PS1='(yiffOS chroot) \u:\w\$ ' \
    PATH=/usr/bin:/usr/sbin        \
    /bin/bash --login +h