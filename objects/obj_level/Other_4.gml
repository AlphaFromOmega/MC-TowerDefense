/// @description ?
loaded = true;

var _width = (room_width div 16) + 1
var _height = (room_height div 16) + 1
for (var i = 0; i < _width; i++)
{
	for (var j = 0; j < _height; j++)
	{
		var _exist = false;
		var _list = ds_list_create();
		var _num = instance_position_list(i*16, j*16, obj_block, _list, true);
		for (var k = 0; k < _num; k++;)
		{
		    if (_list[| k].z == 0)
			{
				_exist = true;
				break;
			}
		}
		ds_list_destroy(_list);
		if !(_exist)
		{
			instance_create_layer(i*16, j*16, "Floor", floor_obj);
		}
	}
}

with (obj_block)
{
	var _list = ds_list_create()
	var _num = instance_position_list(x, bbox_top - 1, obj_block, _list, false)
	if (_num > 0)
	{
	    for (var i = 0; i < _num; i++;)
	    {
	        if (_list[| i].z == z)
			{
				top = false;
				break;
			}
	    }
	}
	ds_list_destroy(_list);
	
	var _list = ds_list_create()
	var _num = instance_position_list(x, bbox_bottom + 1, obj_block, _list, false)
	if (_num > 0)
	{
	    for (var i = 0; i < _num; i++;)
	    {
	        if (_list[| i].z == z)
			{
				bottom = false;
				break;
			}
	    }
	}
	ds_list_destroy(_list);

	var _list = ds_list_create()
	var _num = instance_position_list(bbox_left - 1, y, obj_block, _list, false)
	if (_num > 0)
	{
	    for (var i = 0; i < _num; i++;)
	    {
	        if (_list[| i].z == z)
			{
				left = false;
				break;
			}
	    }
	}
	ds_list_destroy(_list);
	
	var _list = ds_list_create()
	var _num = instance_position_list(bbox_right + 1, y, obj_block, _list, false)
	if (_num > 0)
	{
	    for (var i = 0; i < _num; i++;)
	    {
	        if (_list[| i].z == z)
			{
				right = false;
				break;
			}
	    }
	}
	ds_list_destroy(_list);
}