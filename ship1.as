class ship1 extends MovieClip
{
	var velocity;
	var shootLimiter;
	var enemyTimer;
	var enemies;
	
	
	function onLoad()
	{
		velocity = 10;
		shootLimiter = 0;
		enemyTimer = 0;
		enemies = [];
	}
	
	function onEnterFrame()
	{
			
		shootLimiter += 1;
		
		
		if( Key.isDown(Key.RIGHT) ){_x = _x + velocity;}
		if( Key.isDown(Key.LEFT) ){_x = _x - velocity;}
		if( Key.isDown(Key.UP) ){_y = _y - velocity;}
		if( Key.isDown(Key.DOWN) ){_y = _y + velocity;}
		if( Key.isDown(Key.SPACE) && shootLimiter > 4 )
		{
			shootLimiter= 0;
			var missile = _root.attachMovie( "missle" , "missle" + _root.getNextHighestDepth(), _root.getNextHighestDepth() );
			missile._x = _x +8;
			missile._y = _y -9;
		}
	
		enemyTimer += 1;
		
		if(enemyTimer>20)
		{
			enemyTimer=0;
			
			var enemy = _root.attachMovie("enemyship", "enemyship"+_root.getNextHighestDepth(), _root.getNextHighestDepth());
			
			enemies.push(enemy);
		}	
	}
		
}