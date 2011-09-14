package com.Asteroids
{
	import com.greensock.TweenMax;
	
	public class Rock extends SpaceObject
	{
		public static const MINIMUM_SPEED:Number = .5;
		public static const LARGE_SPEED:Number = 2;
		public static const MEDIUM_SPEED:Number = 4;
		public static const SMALL_SPEED:Number = 6;
		public static const COLORS:Array = new Array(
			0x7D11B1,
			0x009900,
			0xFFEE07,
			0x0A3AC6,
			0xB11111
		);
		
		private var rot:Number = 0;
		
		public function Rock():void
		{
			Asteroids.game.addChild(this);
			this.rotation = Math.random() * 360;
			this.speed = this.randomSpeed(LARGE_SPEED);
			TweenMax.to(this, 0, { colorTransform:{tint: COLORS[Asteroids.game.level%COLORS.length], tintAmount: .75}});
		}
		
		protected function randomSpeed(topSpeed:Number):Number
		{
			return (Math.random() * (topSpeed - MINIMUM_SPEED)) + MINIMUM_SPEED;
		}
		
		public function hitRock(index:int, givePoints:Boolean = false):void
		{
			var newRock:Rock;
			Explosions.create(this.x, this.y);
			Asteroids.game.rocks.splice(index, 1);
			Asteroids.game.removeChild(this);
			this.playExplosion();
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
		
		override public function get rotation():Number
		{
			return rot;
		}
		
		override public function set rotation(r:Number):void
		{
			this.rot = r;
		}
	}
}