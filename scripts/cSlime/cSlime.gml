function slimeInit() {
	atkTimer = choose(60,90)
	_atkTimer = atkTimer
	prepTimer = 60
	_prepTimer = prepTimer
	state = stateSlimeIdle
	landing = false
}

function slimeMoveAndCollide() {

	hsp = image_xscale
	if place_meeting(x + hsp*walkSpd, y, oWall)
	{
		while !place_meeting(x + hsp, y, oWall) {
			x += hsp } 
		hsp = 0 
	}
	x += hsp * walkSpd 
	x = clamp(x, 0 + 7, room_width - 7) 

	vsp += grav 
	vsp = clamp(vsp, -6,6) 
	if place_meeting(x, y + vsp, oWall)
	{
		while (!place_meeting(x, y + sign(vsp), oWall)) {
			y += sign(vsp)/2} 
		vsp = 0 
	}
	y += vsp 

}

function stateSlimeAtk() {
	
	hurtPlayer()
	
	slimeMoveAndCollide()
	sprite_index = animAtk
	walkSpd = 1
	if vsp > 0 {
		landing = true
	}
	if landing and place_meeting(x, y+1, oWall) {
		state = stateSlimeIdle	
	}
}

function stateSlimeAtkPrep() {
	_prepTimer --
	slimeMoveAndCollide()
	var len = sprite_get_number(animAtkPrep)
	sprite_index = animAtkPrep
	if image_index > len - 1 {
		image_speed = 0
	}
	
	if _prepTimer == 0 {
		state = stateSlimeAtk
		image_index = 0
		_prepTimer = prepTimer
		vsp = -2
	}
	
}

function stateSlimeIdle() {
	slimeMoveAndCollide()
	facePlayer()
	walkSpd = 0
	landing = false
	image_speed = 1
	sprite_index = animIdle
	_atkTimer -- 
	if _atkTimer == 0 {
		state = stateSlimeAtkPrep
		image_index = 0
		_atkTimer = atkTimer
	}
}