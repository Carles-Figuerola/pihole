#!/bin/bash

sudo ln pi-hole-export.service /etc/systemd/system/
sudo ln pi-hole-export.timer /etc/systemd/system/
sudo systemctl enable pi-hole-export.timer
sudo systemctl start pi-hole-export.timer

