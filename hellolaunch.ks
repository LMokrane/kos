//hellolaunch

//First, we'll clear the terminal screen to make it look nice
CLEARSCREEN.

//gaz a 100%
lock throttle to 1.0.
LOCK STEERING TO UP.

//This is our countdown loop, which cycles from 10 to 0
PRINT "Counting down:".
FROM {local countdown is 10.} UNTIL countdown = 0 STEP {SET countdown to countdown - 1.} DO {
    PRINT "..." + countdown.
    WAIT 1. // pauses the script here for 1 second.
}

when maxthrust = 0 then {
  print "staging".
  stage.
  preserve.
}

WAIT UNTIL SHIP:ALTITUDE > 70000.
