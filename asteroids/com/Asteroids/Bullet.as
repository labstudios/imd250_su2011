package com.Asteroids
{
	import flash.display.Sprite;
	
	public class Bullet extends Sprite
	{
		private static const SPEED:Number = 10;
		private static const TTL:int = 36;
		private var vx:Number = 0;
		private var vy:Number = 0;
		private var lifespan:int = 0;
		
		public function Bullet(startX:Number = 0, startY:Number = 0, rot:Number = 0):void
		{
			this.x = startX;
			this.y = startY;
			
			this.vx = Math.cos(rot * Math.PI / 180) * SPEED;
			this.vy = Math.sin(rot * Math.PI / 180) * SPEED;
			
			Asteroids.game.addChild(this);
		}
		
		public function run():void
		{
			this.x += this.vx;
			this.y += this.vy;
			
			this.x = this.x > Asteroids.RIGHT ? Asteroids.LEFT:this.x;
			this.x = this.x < Asteroids.LEFT ? Asteroids.RIGHT:this.x;
			this.y = this.y > Asteroids.BOTTOM ? Asteroids.TOP:this.y;
			this.y = this.y < Asteroids.TOP ? Asteroids.BOTTOM:this.y;
			
			this.lifespan++;
			if (this.lifespan > TTL)
			{
				for (var i:int = 0; i < Asteroids.game.bullets.length;++i)
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