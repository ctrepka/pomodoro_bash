#!/bin/sh

beep() {
  $ play -q -n synth 0.1 sin 880 || echo -e "\a" && sleep .15
}

beep_3x() {
	beep && beep && beep
}

work_25m() {
	beep_3x
	notify_send "get to work, peasant!"
	sleep 1500
}

break_5m() {
	beep_3x
	notify_send "starting short_break" && sleep 300
}

break_15m() {
	beep_3x
	notify_send "starting long_break" && sleep 900

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
	notify_send "cycle complete"
}
