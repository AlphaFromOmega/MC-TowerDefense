/// @description ?
if (nextroom)
{
	room_goto_next();
}
if (keyboard_check_pressed(vk_space))
{
	nextroom = true;
}