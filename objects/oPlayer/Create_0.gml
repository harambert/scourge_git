//params
depth = 0
walkSpd = defaultWalkSpd
hsp = 0
vsp = 0
grav = 0.125
jumpHeight = 4
jumps = maxJumps
grounded = false
landed = false
runTimer = 0

//getting hurt
hitFrom = 1 // -1 is left 1 is right
knockBack = 0
_hurtTimer = 30
hurtTimer = _hurtTimer
flash = 0

//inits
oCamera.follow = id 
state = stateNormal