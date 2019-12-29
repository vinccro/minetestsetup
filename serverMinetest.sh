#!/bin/bash

lxc launch -p lanprofile local:16.04 minetestServer1
sleep 5
lxc file push ./containerMinetestRun.sh minetestServer1/root/
sleep 5
echo "ehlwo"
lxc exec minetestServer1 -- sh containerMinetestRun.sh
