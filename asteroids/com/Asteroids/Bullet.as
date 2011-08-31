package com.Asteroids
{
	import flash.display.Sprite;
	
	public class Bullet extends SpaceObject
	{
		private static const SPEED:Number = 10;
		private static const TTL:int = 36;
		private var lifespan:int = 0;
		private var active:Boolean = true;
		
		public function Bullet(startX:Number = 0, startY:Number = 0, rot:Number = 0):void
		{
			this.x = startX;
			this.y = startY;
			this.rotation = rot;
			
			this.speed = SPEED;
			
			Asteroids.game.addChild(this);
		}
		
		override public function run():void
		{
			super.run();
			
			this.lifespan++;
			if (this.active)
			{
				for (var i:int = 0; i < Asteroids.game.rocks.length;++i)
				{
					if (this.hitTestObject(Asteroids.game.rocks[i]))
					{
						Asteroids.game.rocks[i].hitRock(i, true);
						this.lifespan = TTL;
						this.active = false;
						break;
					}
				}
			}
			
			if (this.lifespan > TTL)
			{
				for (i = 0; i < Asteroids.game.bullets.length;++i)
				{
					if (this == Asteroids.game.bullets[i])
					{
						Asteroids.game.bullets.splice(i, 1);
						break;
					}
				}
				Asteroids.game.removeChild(this);
			}
			
		}
	}
}