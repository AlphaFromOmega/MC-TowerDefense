//@function wrap(input, max)
function wrap(_input, _max)
{
	return (_input % _max + _max) % _max;
}