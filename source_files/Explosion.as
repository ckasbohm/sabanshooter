﻿//The explosion class is super simpleclass Explosion extends MovieClip{		//At frame rate, just check to see if this explosion has reached the last frame in it's animation timeline	function onEnterFrame()	{		//if this explosion's current frame is equal to this explosion's total number of frames		if(this._currentframe == this._totalframes)		{			//remove this explosion from stage, it is done playing			this.removeMovieClip();		}	}}