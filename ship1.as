﻿class ship1 extends MovieClip
{
	var velocity;
	var shootLimiter;
	var enemyTimer;
	var enemies;
	var score;
	var health;
	
	
	function newGame()
	
	{
		this._visible=true;
		_root.gameOverScreen._visible=false;
		resetHealth();
		resetScore();
		_x = 25;
		_y = 75;
		
	}
	
	function explode()
	
	{
		this._visible = false;
		var explosion = _root.attachMovie( "Explosion" , "Explosion" + 	_root.getNextHighestDepth(), _root.getNextHighestDepth() );
		explosion._x = _x;
		explosion._y = _y;
		for(var i in enemies)
		{
			enemies[i].explode();
		}
	}
	
	function updateHealth(points)
	{
		
		if(health<1)
		
		{
			_root.gameOverScreen._visible = true;
			explode();
			_root.healthMeter.bar._visible=false;
			_root.healthMeter._visible=false;
		}
		 health += points;
		_root.healthMeter.bar._xscale = health;
	}
	
	function resetHealth()
	
	{
		health = 100;
		_root.healthMeter.bar._xscale = 100;
		_root.healthMeter._visible = true;
		_root.healthMeter.bar._visible = true;
	}
	
	function resetScore()
	
	{
		score=0;
		_root.scoreText.text = score;
		_root.scoreText.text._visible = true;
	}
	
	
	function updateScore(points)
	{
		score += points;
		_root.scoreText.text = score;
		
	}
	function onLoad()
	{
		velocity = 10;
		shootLimiter = 0;
		enemyTimer = 0;
		enemies = [];
		resetScore();
		resetHealth();
		_root.gameOverScreen._visible = false;
		_root.gameOverScreen.playAgainButton.onPress = function()
		{
			
			_root.ship.newGame();
		}
		
		
	}
	
	function onEnterFrame()
	{
			
		if(health>1)
		
		{
		shootLimiter += 1;
		}
		
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
		
		if(_root.ship.health<1)
		{
			enemyTimer = 5;
		}
		
		
		if(enemyTimer>5)
		{
			
			var enemy = _root.attachMovie("enemyship", "enemyship" + _root.getNextHighestDepth(), _root.getNextHighestDepth());
			enemies.push(enemy);
		
			enemyTimer=0;
			
			
		}	
		
		
	}
		
}