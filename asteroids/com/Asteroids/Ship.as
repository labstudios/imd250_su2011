package com.Asteroids
{
	import flash.display.Sprite;
	
	public class Ship extends SpaceObject
	{
		private static const ROTATE_SPEED:Number = 6;
		private static const ACCELERATION:Number = .3;
		private static const TOP_SPEED:Number = 4;
		private static const FIRE_SPACE:int = 12;
		
		private var _up:Boolean = false;
		private var _down:Boolean = false;
		private var _left:Boolean = false;
		private var _right:Boolean = false;
		private var _space:Boolean = false;
		private var fireRate:int = 0;
		
		public function Ship():void
		{
			
		}
		
		override public function run():void
		{
			if (this._up)
			{
				if (this.speed >= TOP_SPEED)
				{
					this.vx -= Math.cos(this.direction * Math.PI / 180) * ACCELERATION;
					this.vy -= Math.sin(this.direction * Math.PI / 180) * ACCELERATION;
				}
				this.vx += Math.cos(this.rotation * Math.PI / 180) * ACCELERATION;
				this.vy += Math.sin(this.rotation * Math.PI / 180) * ACCELERATION;
			}
			if (this._left)
			{
				this.rotation -= ROTATE_SPEED;
			}
			if (this._right)
			{
				this.rotation += ROTATE_SPEED;
			}
			if (this._space)
			{
				this.fireRate--;
				
				if (this.fireRate <= 0)
				{
					Asteroids.game.bullets.push(new Bullet(this.x, this.y, this.rotation));
					this.fireRate = FIRE_SPACE;
				}
			}
			else
			{
				this.fireRate = 0;
			}
			
			super.run();
			
			/*for (var i:int = 0; i < Asteroids.game.rocks.length;++i)
			{
				if (this.hitTestObject(Asteroids.game.rocks[i]))
				{
					Asteroids.game.rocks[i].hitRock(i);
					this.visible = false;
					break;
				}
			}*/
			
		}
		
		public function killShip():void
		{
			
		}
		
		public function set up(b:Boolean):void
		{
			this._up = b;
		}
		
		public function set down(b:Boolean):void
		{
			this._down = b;
		}
		
		public function set left(b:Boolean):void
		{
			this._left = b;
		}
		
		public function set right(b:Boolean):void
		{
			this._right = b;
		}
		
		public function set space(b:Boolean):void
		{
			this._space = b;
		}
	}
}