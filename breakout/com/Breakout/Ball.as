package com.Breakout
{
	import flash.display.Sprite;
	import com.Breakout.Game;
	
	public class Ball extends Sprite
	{
		private var vx:Number = -3;
		private var vy:Number = -3;
		
		public function Ball():void
		{
			
		}
		
		public function run(e:* = null):void
		{
			var forceX:Boolean = false;
			var forceY:Boolean = false;
			
			if (this.nextLeft < Game.LEFT_WALL)
			{
				this.left = Game.LEFT_WALL;
				forceX = true;
				this.vx *= -1;
			}
			if (this.nextTop < Game.TOP_WALL)
			{
				this.top = Game.TOP_WALL;
				forceY = true;
				this.vy *= -1;
			}
			if (this.nextRight > Game.RIGHT_WALL)
			{
				this.right = Game.RIGHT_WALL;
				forceX = true;
				this.vx *= -1;
			}
			if (this.top > Game.BOTTOM)
			{
				forceX = true;
				forceY = true;
			}
			
			forceX ? null:this.x += vx;
			forceY ? null:this.y += vy;
			
			
		}
		
		public function get top():Number
		{
			return this.y - (this.height / 2);
		}
		
		public function set top(n:Number):void
		{
			this.y = n + (this.height / 2);
		}
		
		public function get bottom():Number
		{
			return this.y + (this.height / 2);
		}
		
		public function set bottom(n:Number):void
		{
			this.y = n - (this.height / 2);
		}
		
		public function get left():Number
		{
			return this.x - (this.width / 2);
		}
		
		public function set left(n:Number):void
		{
			this.x = n + (this.width / 2);
		}
		
		public function get right():Number
		{
			return this.x + (this.width / 2);
		}
		
		public function set right(n:Number):void
		{
			this.x = n - (this.width / 2);
		}
		
		//--------------------------------------
		
		public function get nextTop():Number
		{
			return this.y - (this.height / 2) + vy;
		}
		
		public function get nextBottom():Number
		{
			return this.y + (this.height / 2) + vy;
		}
		
		public function get nextLeft():Number
		{
			return this.x - (this.width / 2) + vx;
		}
		
		public function get nextRight():Number
		{
			return this.x + (this.width / 2) + vx;
		}
	}
}