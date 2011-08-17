package com.Breakout
{
	import flash.display.Sprite;
	import com.Breakout.Ball;
	import com.Breakout;
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
		public static const SPEED_INCREASE:Number = .5;
		
		private static var instance:Game;
		
		private var rows:int = 3;
		private var bricks:Vector.<Brick> = new Vector.<Brick>();
		
		public function Game():void
		{
			instance = this;
			this.addEventListener(Event.ADDED_TO_STAGE, added);
			this.addEventListener(Event.REMOVED_FROM_STAGE, killMe);
		}
		
		private function added(e:* = null):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, added);
			this.lives = (parent as Breakout).startingLives;
			this.level = 1;
			this.score = 0;
			setupLevel();
		}
		
		public function startGame():void
		{
			this.addEventListener(Event.ENTER_FRAME, run);
		}
		
		public function stopGame():void
		{
			this.removeEventListener(Event.ENTER_FRAME, run);
		}
		
		private function setupLevel():void
		{
			if (this.level > 1)
			{
				this.ball.speed += SPEED_INCREASE;
				rows++;
			}
			var numBricks:int = rows * BPR;
			var curX:Number = BRICKX;
			var curY:Number = BRICKY;
			this.ball.newBall();
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
			startGame();
		}
		
		private function run(e:* = null):void
		{
			ball.reset();
			paddle.x = this.mouseX;
			paddle.run();
			ball.run();
		}
		
		public function brickDestroyed(brick:Brick):void
		{
			for (var i:int = 0; i < this.bricks.length;++i)
			{
				if (this.bricks[i] == brick)
				{
					this.bricks.splice(i, 1);
					break;
				}
			}
			
			if (this.bricks.length <= 0)
			{
				this.level++;
				stopGame();
				this.setupLevel();
			}
		}
		
		public function addScore(n:Number):void
		{
			this.score += n * (parent as Breakout).scoreMultiplier;
		}
		
		public function died():void
		{
			this.lives--;
			if (this.lives < 0)
			{
				stopGame();
				(parent as Breakout).gotoEnd();
			}
			else
			{
				ball.newBall();
			}
		}
		
		private function killMe(e:* = null):void
		{
			this.removeEventListener(Event.REMOVED_FROM_STAGE, killMe);
			stopGame();
			instance = null;
		}
		
		public function get ball():Ball
		{
			return this["ball_mc"] as Ball;
		}
		
		public function get paddle():Paddle
		{
			return this["paddle_mc"] as Paddle;
		}
		
		public function get blocks():Vector.<Brick>
		{
			return this.bricks;
		}
		
		public function get lives():int
		{
			return int(lives_txt.text);
		}
		
		public function set lives(n:int):void
		{
			lives_txt.text = n.toString();
		}
		
		public function get level():int
		{
			return int(level_txt.text);
		}
		
		public function set level(n:int):void
		{
			level_txt.text = n.toString();
		}
		
		public function get score():int
		{
			return int(score_txt.text);
		}
		
		public function set score(n:int):void
		{
			score_txt.text = n.toString();
		}
		
		public static function get game():Game
		{
			return instance;
		}
	}
}