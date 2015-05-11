#!/bin/sh
# -*- mode: shell-script; indent-tabs-mode: nil; sh-basic-offset: 4; -*-
# ex: ts=8 sw=4 sts=4 et filetype=sh

type getarg >/dev/null 2>&1 || . /lib/dracut-lib.sh

SERVICEDIR=$NEWROOT/etc/sv
SERVICES="$(getarg live.services)"

for f in ${SERVICES}; do
        ln -sf /etc/sv/$f $NEWROOT/etc/runit/runsvdir/default/
done

dhcpcd=1
wpa_supplicant=1
for f in connmand NetworkManager wicd; do
    if [ -e $SERVICEDIR/$f ]; then
        unset dhcpcd
		unset wpa_supplicant
    fi
done

# Enable all services by default... with some exceptions.
for f in $SERVICEDIR/*; do
    _service=${f##*/}
    case "${_service}" in
        agetty-console|agetty-generic|agetty-serial|agetty-tty[SAU]*|sulogin|dhcpcd-*|iptables|ip6tables) ;; # ignored
        dhcpcd) [ -n "$dhcpcd" ] && ln -sf ${f##$NEWROOT} $NEWROOT/etc/runit/runsvdir/default/;;
		wpa_supplicant) [ -n "$wpa_supplicant" ] && ln -sf ${f##$NEWROOT} $NEWROOT/etc/runit/runsvdir/default/;; # test to stop wpa
        *) ln -sf ${f##$NEWROOT} $NEWROOT/etc/runit/runsvdir/default/;;
    esac
done
