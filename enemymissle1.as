class enemymissle1 extends MovieClip

{
	
var speed;

	function onLoad()

	{
		speed= -20	
	}
	
	function onEnterFrame()
	{
		_x += speed;
		
		if(this.hitTest(_root.ship))
		{
			this.removeMovieClip();
			_root.ship.updateHealth(-.2);
		}
		if(_x<0)
		{
			this.removeMovieClip();
		}
		
	}
	
}