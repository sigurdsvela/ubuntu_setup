#!/bin/bash

( /etc/systemd/system/keyboardmap.service.d/set_keyboard.sh & )
xkeysnail /etc/systemd/system/keyboardmap.service.d/xkeysnail.config.py

