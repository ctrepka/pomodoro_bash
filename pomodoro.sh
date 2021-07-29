#!/bin/sh

beep() {
	_alarm 800 400 && sleep .20
}

_alarm() {
  ( \speaker-test --frequency $1 --test sine )&
  pid=$!
  \sleep 0.${2}s
  \kill -9 $pid
}

beep_3x() {
	beep && beep && beep
}

work_25m() {
	beep_3x
	notify-send "get to work, peasant!"
	sleep 1500
}

break_5m() {
	beep_3x
	notify-send "starting short_break" && sleep 300
}

break_15m() {
	beep_3x
	notify-send "starting long_break" && sleep 900
}

short_cycle() {
	work_25m
	break_5m
}

long_cycle() {
	work_25m
	break_15m
}

start_pomo() {
	short_cycle
	short_cycle
	short_cycle
	long_cycle
	notify-send "cycle complete"
}
