function facePlayer(){
	if instance_exists(oPlayer) {
		if oPlayer.x > x {
			image_xscale = 1	
		} else {
			image_xscale = -1	
		}
	}
}

function hurtPlayer() {
	if place_meeting(x,y,oPlayer) and oPlayer.state != stateHurt	{
		if oPlayer.x > x {
			oPlayer.hitFrom = -1	
		} else {
			oPlayer.hitFrom = 1	
		}
		
		with(oPlayer) {
			knockBack = other.knockBack
			vsp = -knockBack * 2
			state = stateHurt
			flash = 10
			
			instance_create_depth(x,y,-1,oHurtEffect)
		}
		
		frameFreeze(8)
		screenShake(3,20)
		playSFX(sndPlayerHurt)
		
		health -= dmg
	}	
}