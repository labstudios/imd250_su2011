package com.Asteroids
{
	
	
	public class Rock extends SpaceObject
	{
		public static const MINIMUM_SPEED:Number = .5;
		public static const LARGE_SPEED:Number = 2;
		public static const MEDIUM_SPEED:Number = 4;
		public static const SMALL_SPEED:Number = 6;
		
		public function Rock():void
		{
			Asteroids.game.addChild(this);
			this.rotation = Math.random() * 360;
			this.speed = this.randomSpeed(LARGE_SPEED);
		}
		
		protected function randomSpeed(topSpeed:Number):Number
		{
			return (Math.random() * (topSpeed - MINIMUM_SPEED)) + MINIMUM_SPEED;
		}
		
		public function hitRock(index:int, givePoints:Boolean = false):void
		{
			var newRock:Rock;
			Asteroids.game.rocks.splice(index, 1);
			Asteroids.game.removeChild(this);
			
			if (this is LargeRock)
			{
				Asteroids.game.score += givePoints ? 15:0;
				for (var i:int = 0; i < 2; ++i)
				{
					newRock = new MediumRock();
					newRock.x = this.x;
					newRock.y = this.y;
					Asteroids.game.rocks.push(newRock);
				}
			}
			else if (this is MediumRock)
			{
				Asteroids.game.score += givePoints ? 25:0;
				for (i = 0; i < 3; ++i)
				{
					newRock = new SmallRock();
					newRock.x = this.x;
					newRock.y = this.y;
					Asteroids.game.rocks.push(newRock);
				}
			}
			else
			{
				Asteroids.game.score += givePoints ? 50:0;
			}
		}
	}
}