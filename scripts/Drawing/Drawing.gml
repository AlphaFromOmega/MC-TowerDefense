//@function draw_set(colour, alpha)
function draw_set()
{
	var _col, _alpha
	if (argument_count > 0)
    {
		_col = argument[0]
	}
	else
	{
		_col = c_white;
	}
	if (argument_count > 1)
    {
		_alpha = argument[1]
	}
	else
	{
		_alpha = 1;
	}
	draw_set_alpha(_alpha);
	draw_set_color(_col);
}
