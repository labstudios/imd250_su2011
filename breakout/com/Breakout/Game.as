package com.Breakout
{
	import flash.display.Sprite;
	import com.Breakout.Ball;
	import flash.events.Event;
	
	public class Game extends Sprite
	{
		public static const LEFT_WALL:Number = 0;
		public static const TOP_WALL:Number = 0;
		public static const RIGHT_WALL:Number = 360;
		public static const BOTTOM:Number = 550;
		public static const BPR:int = 10;
		public static const BRICKX:Number = 18;
		public static const BRICKY:Number = 43;
		
		private static var instance:Game;
		
		private var rows:int = 3;
		private var bricks:Vector.<Brick> = new Vector.<Brick>();
		
		public function Game():void
		{
			instance = this;
			this.addEventListener(Event.ENTER_FRAME, run);
			setupLevel();
		}
		
		private function setupLevel():void
		{
			var numBricks:int = rows * BPR;
			var curX:Number = BRICKX;
			var curY:Number = BRICKY;
			for (var i:int = 0; i < numBricks;++i)
			{
				if (i % BPR == 0 && i > 0)
				{
					curY += Brick.HEIGHT + Brick.SPACE;
					curX = BRICKX;
				}
				bricks.push(new Brick(curX, curY));
				curX += Brick.WIDTH + Brick.SPACE;
			}
		}
		
		private function run(e:* = null):void
		{
			paddle.x = this.mouseX;
			paddle.run();
			ball.run();
		}
		
		public function get ball():Ball
		{
			return this["ball_mc"] as Ball;
		}
		
		public function get paddle():Paddle
		{
			return this["paddle_mc"] as Paddle;
		}
		
		public static function get game():Game
		{
			return instance;
		}
	}
}