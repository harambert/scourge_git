
function getControls() {
	left = false 
	right = false 
	jump = false 
	jumpRelease = false 
	atk = false 
	
	if keyboard_check(ord("A")) left = true 
	if keyboard_check(ord("D")) right = true 
	if keyboard_check_pressed(ord("K")) or
	keyboard_check_pressed(ord("W")) {
		jump = true 
	}	
	if keyboard_check_released(ord("K")) or 
	keyboard_check_released(ord("W")) {
		jumpRelease = true 
	}
	if keyboard_check_pressed(ord("J")) {
		atk = true	
	}
}

function moveAndCollide() {

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

function stateAtk() {
	if grounded {
		sprite_index = sPlayerAtk 
	} else {
		sprite_index = sPlayerAtkAir	
	}
	if image_index > 0 and !instance_exists(oAtkHitBox) {
		instance_create_depth(x,y,0,oAtkHitBox);	
	}
	moveAndCollide()
}

function stateHurt() {
	hurtTimer --
	sprite_index = sPlayerHurt
	if hurtTimer == 0 {
		hurtTimer = _hurtTimer
		state = stateNormal
	}
	hsp = -1 * (knockBack * hitFrom)
	image_xscale = hitFrom
	moveAndCollide()
}

function stateNormal() {
	
	hsp = right - left 
	moveAndCollide()
	
	//JUMPING

	if place_meeting(x, y+1, oWall) {
		grounded = true 
		jumps = maxJumps
	} else {
		grounded = false 
		landed = false 
		alarm[1] = -1  //continue boost
	}

	if jumps > 0 and jump {
		vsp = -jumpHeight
		repeat(5) {
			with (instance_create_layer(x + random_range(-2,2),bbox_bottom,"Effects",oDust)){
				vsp = random_range(-0.5,-3) 
			}
		}
		jumps -= 1
		playSFX(sndJump, true)
	}

	if jumpRelease {
		if vsp < -1 {
			vsp = -1 
		}
	}
	
	//ANIMATION
	if hsp != 0 and grounded {
		sprite_index = sPlayerRun
		if runTimer < 10 {
			runTimer += 1
		} else {
			runTimer = 0 
			with (instance_create_layer(x,bbox_bottom+1,"Effects",oDust)){
				vsp = random_range(0,-1) 
			}
		}
	} else {
		sprite_index = sPlayerIdle
	}

	//Landing
	if grounded and !landed {
		repeat(5) {
			with (instance_create_layer(x + random_range(-2,2),bbox_bottom,"Effects",oDust)){
				hsp = random_range(-2.5,2.5) 
			}
		}
		landed = true 
		playSFX(sndLand, true) 
	}

	if !grounded {
		sprite_index = sPlayerJump
		if vsp < 0 {
			image_index = 0 
		} else {
			image_index = 1 
		}
	}

	if hsp != 0 {
		image_xscale = sign(hsp) 
	}
	
	//ATTACKING
	if atk {
		image_index = 0
		if grounded {
			hsp = 0
		} else {
			hsp = image_xscale * 0.4
			vsp = -1
		}
		state = stateAtk
	}
}
