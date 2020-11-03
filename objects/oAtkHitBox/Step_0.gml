if instance_exists(oPlayer) {
	image_xscale = oPlayer.image_xscale
	x = oPlayer.x
	y = oPlayer.y
	if oPlayer.state != stateAtk {
		instance_destroy()	
	}
} else {
	instance_destroy()	
}