function playSFX(soundID, isPitched) {
	if isPitched {
		audio_sound_pitch(soundID, choose(0.9,1,1.1)) 	
	}
	audio_play_sound(soundID,1,0) 
}

function frameFreeze(_fps) {
	game_set_speed(_fps, gamespeed_fps);
	oGame.alarm[11] = 1;
}

function screenShake(mag, dur) {
	with(oCamera)
	{
		if (mag > shakeremain)
		{
			shakemagnitude = mag
			shakeremain = mag
			shakelength = dur
		}
	}
}
