var _id = other.id
var _hit = false

var i = 0
repeat(ds_list_size(hitList)) {
	var _val = ds_list_find_value(hitList, i)
	if _id == _val {
		_hit = true	
	}
	i++
}

if !_hit {
	ds_list_add(hitList, _id)	
	instance_create_depth(other.x,other.y,-1,oSwordHit)
	other.flash = 5
}