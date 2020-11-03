draw_self()  

if flash > 0 {
	shader_set(shWhite)  
	draw_self()  
	shader_reset()  
	flash --
}