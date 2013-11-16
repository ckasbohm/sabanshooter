﻿class enemyship extends MovieClip 
{
	var speed;
	
	function explode()
	
	{
		var explosion = _root.attachMovie( "Explosion" , "Explosion" + 	_root.getNextHighestDepth(), _root.getNextHighestDepth() );
		explosion._x = _x;
		explosion._y = _y;
		this.removeMovieClip();
	
	}
		
	function onLoad()

	{
		_x= 700;
		_y= Math.random()*300;
		speed = Math.random()*5+5;
	}
	
	
	function onEnterFrame()
	{
		_x-=speed;
		
		if(_x<-100)
		{
			this.removeMovieClip();
		}
	

		if(this.hitTest(_root.ship))
		{
			explode();
		}
		
		if(this.hitTest(_root.missle))
		{
			explode();
		}
		
	}
		

}