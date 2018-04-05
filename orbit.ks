CLEARSCREEN.

//gaz a 100%
lock throttle to 1.0.

when maxthrust = 0 then {
  print "staging".
  stage.
  preserve.
}

// on pointe la fusee vers le haut (azimuth, inclinaison)
set gravity to heading(90,90).
lock steering to gravity.

until ship:apoapsis > 100000 {
  //on pointe vers le haut jusqu'a l'altitude de 2000m
  if ship:altitude < 2000 {

    set gravity to heading(90,90).
  // a partir de 2000m, on incline la fusee a 70°
  } else if ship:altitude > 2000 and SHIP:facing:pitch > 0.09 {
    set gravity to heading(90,70).

  // quand le prograde atteint 70°
  } else if SHIP:srfprograde:pitch < ship:facing:pitch {
    // on lache le controle de la fusee
    unlock steering.
  }.
}.

print "apoapsis : 100km".
// on coupe les gaz
lock throttle to 0.


// quand on passe l'altitude de 75Km, on decouple et on reprend le controle de la direction.
// on garde la portance des ailerons dans l'atmosphere, pour maintenir la fusee droite
wait until ship:altitude > 75000.
stage.
lock steering to gravity.
set gravity to heading(90,0).

// 25s avant Apoapsis, gaz à 100%
wait until eta:apoapsis < 25.
lock throttle to 1.0.

// on point vers l'est à l'horizontale, jusqu'à periapsis = 100km
until ship:periapsis > 100000 {
  set gravity to heading(90,0).
}.

print "periapsis : 100km".
lock throttle to 0.
