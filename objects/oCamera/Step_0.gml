//update destination

if instance_exists(follow)
{
	x_to = follow.x 
	y_to = follow.y 
}

//update object position
x += (x_to - x) / 10 
y += (y_to - y) / 10


x = clamp(x,defRoomWidth/2,room_width - defRoomWidth/2) 
y = clamp(y,(camera_get_view_height(cam) *0.5) + buff,room_height-(camera_get_view_height(cam) *0.5)) 

//screen shake
x += random_range(-shakeremain, shakeremain) 
y += random_range(-shakeremain, shakeremain) 
shakeremain = max(0,shakeremain -((1/shakelength)*shakemagnitude)) 


//update camera view
camera_set_view_pos(cam, x - (camera_get_view_width(cam) *0.5) , y - (camera_get_view_height(cam) *0.5)) 

var _h = display_get_height() 
var _w = display_get_width() 
var room_aspect = defRoomWidth / defRoomHeight 
var aspect = _w / _h 

var difference = room_aspect - aspect

var _xscale = max(1,1 - difference/2)
var _yscale = _xscale 
var layID = layer_get_id("bgSky") 
var backID = layer_background_get_id(layID) 


//update BG
if (layer_exists("bgSky"))
{
	layer_x("bgSky", x-(camera_get_view_width(cam) *0.5)) 
	layer_y("bgSky", y-(camera_get_view_height(cam) *0.5)) 
	layer_background_xscale(backID, _xscale) 
	layer_background_yscale(backID, _yscale) 
}