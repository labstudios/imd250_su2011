package com.Asteroids
{
	import flash.display.Sprite;
	
	public class Ship extends Sprite
	{
		private static const ROTATE_SPEED:Number = 6;
		private static const ACCELERATION:Number = .3;
		private static const TOP_SPEED:Number = 4;
		
		private var _up:Boolean = false;
		private var _down:Boolean = false;
		private var _left:Boolean = false;
		private var _right:Boolean = false;
		private var _space:Boolean = false;
		
		private var vx:Number = 0;
		private var vy:Number = 0;
		
		public function Ship():void
		{
			
		}
		
		public function run():void
		{
			if (this._up)
			{
				this.vx += Math.cos(this.rotation * Math.PI / 180) * ACCELERATION;
				this.vy += Math.sin(this.rotation * Math.PI / 180) * ACCELERATION;
				
				if (this.speed > TOP_SPEED)
				{
					this.vx = Math.cos(this.rotation * Math.PI / 180) * TOP_SPEED;
					this.vy = Math.sin(this.rotation * Math.PI / 180) * TOP_SPEED;
				}
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
				Asteroids.game.bullets.push(new Bullet(this.x, this.y, this.rotation));
				this._space = false;
			}
			
			this.x += this.vx;
			this.y += this.vy;
			
			this.x = this.x > Asteroids.RIGHT ? Asteroids.LEFT:this.x;
			this.x = this.x < Asteroids.LEFT ? Asteroids.RIGHT:this.x;
			this.y = this.y > Asteroids.BOTTOM ? Asteroids.TOP:this.y;
			this.y = this.y < Asteroids.TOP ? Asteroids.BOTTOM:this.y;
		}
		
		private function get speed():Number
		{
			var asq:Number = this.vx * this.vx;
			var bsq:Number = this.vy * this.vy;
			var csq:Number = asq + bsq;
			return Math.sqrt(csq);
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