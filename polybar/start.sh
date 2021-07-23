#!/bin/bash

killall -q polybar

polybar left &
polybar right &
polybar spotify &
polybar fill &
#make sure tray and now playing get drawn on top of the existing bars
wait 1
polybar playing &
polybar tray &
