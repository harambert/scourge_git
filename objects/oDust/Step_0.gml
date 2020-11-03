x += hsp 
y += vsp 
if hsp > 0 {
	hsp = max(0, hsp -0.2) 
} else {
	hsp = min(0, hsp +0.2) 
}
vsp = min(0, vsp + 0.2) 