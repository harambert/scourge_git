globalvar displayTest;
displayTest = true

display_set_gui_size(1920,1080)
globalvar defRoomHeight, defRoomWidth, guiw, guih, defaultWalkSpd, maxJumps, mobile;
defRoomHeight = room_height 
defRoomWidth = room_width 
guiw = display_get_gui_width() 
guih = display_get_gui_height() 

//player params
defaultWalkSpd = 1.5
maxJumps = 1

//inits
mobile = false 
if os_type != os_windows and os_type != os_macosx {
	mobile = true	
}

//skip splash
alarm[0] = 10 