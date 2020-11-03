cam = view_camera[0] 
follow = oPlayer 
buff = 0

aspect = display_get_width()/display_get_height() 

x_to = defRoomWidth / 2
y_to = ystart 

shakelength = 0 
shakemagnitude = 0 
shakeremain = 0      

if displayTest {
	alarm[0] = 60 
}

function window_resize() {
	var _h = display_get_height() 
	var _w = display_get_width() 

	var room_aspect = defRoomWidth / defRoomHeight 
	aspect = _w / _h 

	var difference = room_aspect - aspect

	window_set_size(_w, _h)
	window_set_position(0, 0)
	view_set_wport(0, _w)
	view_set_hport(0, _h)
	camera_set_view_size(view_camera[0], defRoomWidth - (defRoomWidth * difference /2), defRoomHeight)
	surface_resize(application_surface, view_wport[0], view_hport[0])

	guih = display_get_gui_height() 
	guiw = display_get_gui_width() 	
}