#!/bin/bash

killall -q polybar

polybar left &
polybar right &
polybar center &
polybar tray &
