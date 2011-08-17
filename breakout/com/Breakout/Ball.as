package com.Breakout
{
	import flash.display.Sprite;
	import com.Breakout.Game;
	
	public class Ball extends GameObject
	{
		private static const BAD_DEFAULT:Number = -9999999;
		private var vx:Number = -3;
		private var vy:Number = -3;
		private var forceX:Boolean = false;
		private var forceY:Boolean = false;
		private var startX:Number;
		private var startY:Number;
		
		public function Ball():void
		{
			this.startX = this.x;
			this.startY = this.y;
			this.speed = 4;
		}
		
		public function reset():void
		{
			this.forceX = false;
			this.forceY = false;
		}
		
		public function run(e:* = null):void
		{
			if (this.nextLeft < Game.LEFT_WALL)
			{
				this.hitLeft(Game.LEFT_WALL);
			}
			if (this.nextTop < Game.TOP_WALL)
			{
				this.hitTop(Game.TOP_WALL);
			}
			if (this.nextRight > Game.RIGHT_WALL)
			{
				this.hitRight(Game.RIGHT_WALL);
			}
			if (this.top > Game.BOTTOM)
			{
				this.forceX = true;
				this.forceY = true;
				Game.game.died();
			}
			
			this.checkBricks();
			
			forceX ? null:this.x += vx;
			forceY ? null:this.y += vy;
			
			
		}
		
		private function checkBricks():void
		{
			for (var i:int = 0; i < Game.game.blocks.length;++i)
			{
				var block:Brick = Game.game.blocks[i];
				if (this.nextBottom > block.top ||
					this.nextTop < block.bottom ||
					this.nextY < block.bottom ||
					this.nextY > block.top)
				{
					if (block.hitTestPoint(this.nextX, this.nextTop, true))
					{
						this.hitTop(block.bottom);
						block.hit();
					}
					else if (block.hitTestPoint(this.nextRight, this.nextY, true))
					{
						this.hitRight(block.left);
						block.hit();
					}
					else if (block.hitTestPoint(this.nextX, this.nextBottom, true))
					{
						this.hitBottom(block.top);
						block.hit();
					}
					else if (block.hitTestPoint(this.nextLeft, this.nextY, true))
					{
						this.hitLeft(block.right);
						block.hit();
					}
				}
			}
		}
		
		public function newBall():void
		{
			this.x = this.startX;
			this.y = this.startY;
			this.speed = this.speed;
		}
		
		public function hitBottom(b:Number = BAD_DEFAULT):void
		{
			if (b != BAD_DEFAULT)
			{
				this.bottom = b;
				this.forceY = true;
			}
			if (vy > 0)
			{
				vy *= -1;
			}
		}
		
		public function hitTop(t:Number = BAD_DEFAULT):void
		{
			if (t != BAD_DEFAULT)
			{
				this.top = t;
				this.forceY = true;
			}
			if (vy < 0)
			{
				vy *= -1;
			}
		}
		
		public function hitLeft(l:Number = BAD_DEFAULT):void
		{
			if (l != BAD_DEFAULT)
			{
				this.left = l;
				this.forceX = true;
			}
			if (vx < 0)
			{
				vx *= -1;
			}
		}
		
		public function hitRight(r:Number = BAD_DEFAULT):void
		{
			if (r != BAD_DEFAULT)
			{
				this.right = r;
				this.forceX = true;
			}
			if (vx > 0)
			{
				vx *= -1;
			}
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
		
		public function get nextX():Number
		{
			return this.x + vx;
		}
		
		public function get nextY():Number
		{
			return this.y + vy;
		}
		
		public function set speed(n:Number):void
		{
			this.vx = -n;
			this.vy = -n;
		}
		
		public function get speed():Number
		{
			return Math.abs(this.vx);
		}
	}
}