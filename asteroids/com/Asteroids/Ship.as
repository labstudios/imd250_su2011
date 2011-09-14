package com.Asteroids
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import com.greensock.TweenMax;
	
	public class Ship extends SpaceObject
	{
		private static const ROTATE_SPEED:Number = 6;
		private static const ACCELERATION:Number = .3;
		private static const TOP_SPEED:Number = 4;
		private static const FIRE_SPACE:int = 12;
		private static const INVINCIBLE_COLOR:int = 0xff0000;
		
		private var _up:Boolean = false;
		private var _down:Boolean = false;
		private var _left:Boolean = false;
		private var _right:Boolean = false;
		private var _space:Boolean = false;
		private var fireRate:int = 0;
		private var _invincible:Boolean = false;
		
		public function Ship():void
		{
			this.flames.visible = false;
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
			if (this._down)
			{
				this.speed = 0;
				this.x = Math.random() * Asteroids.RIGHT;
				this.y = Math.random() * Asteroids.BOTTOM;
				this.playTeleport();
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
			
			for (var i:int = 0; i < Asteroids.game.rocks.length;++i)
			{
				if (this.hitTestObject(Asteroids.game.rocks[i]))
				{
					if (this.flames.visible &&
						this.flames.hitTestObject(Asteroids.game.rocks[i]))
					{
						Asteroids.game.rocks[i].hitRock(i);
					}
					else
					{
						Asteroids.game.rocks[i].hitRock(i);
						this.killShip();
						break;
					}
				}
			}
			
		}
		
		public function killShip():void
		{
			if (!this.invincible)
			{
				this.visible = false;
			}
		}
		
		private function makeMortal():void
		{
			this.invincible = false;
		}
		
		public function set up(b:Boolean):void
		{
			this._up = b;
			this.flames.visible = b;
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
		
		public function set invincible(b:Boolean):void
		{
			this._invincible = b;
			if (b)
			{
				TweenMax.fromTo(this, 3, {colorTransform:{tint: INVINCIBLE_COLOR, tintAmount: .75} }, {colorTransform:{tint: null, tintAmount: 0}, onComplete: this.makeMortal } );
			}
		}
		
		public function get invincible():Boolean
		{
			return this._invincible;
		}
		
		public function get flames():MovieClip
		{
			return this['flames_mc'] as MovieClip;
		}
	}
}