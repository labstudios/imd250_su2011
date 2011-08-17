package com.Breakout
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class Paddle extends GameObject
	{
		
		public function Paddle():void
		{
			
		}
		
		public function run():void
		{
			if (Game.game.ball.nextBottom > this.top &&
				this.hitTestPoint(Game.game.ball.nextX, Game.game.ball.nextBottom, true))
			{
				Game.game.ball.hitBottom(this.top);
				if (Game.game.ball.nextX < this.x - (width * .2))
				{
					Game.game.ball.hitRight();
				}
				if (Game.game.ball.nextX > this.x + (width * .2))
				{
					Game.game.ball.hitLeft();
				}
			}
		}
		
		override public function set x(value:Number):void
		{
			super.x = value;
			if (this.left < Game.LEFT_WALL)
			{
				this.left = Game.LEFT_WALL;
			}
			if (this.right > Game.RIGHT_WALL)
			{
				this.right = Game.RIGHT_WALL;
			}
		}
	}
}