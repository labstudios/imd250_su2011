package com.Asteroids
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	public class Asteroids extends Sprite
	{
		public static const LEFT:Number = 0;
		public static const TOP:Number = 0;
		public static const RIGHT:Number = 400;
		public static const BOTTOM:Number = 400;
		public static const DEAD_FOR:int = 50;
		private static var instance:Asteroids;
		
		private var _bullets:Vector.<Bullet> = new Vector.<Bullet>();
		private var _rocks:Vector.<Rock> = new Vector.<Rock>();
		private var numRocks:int = 3;
		private var resDelay:int = DEAD_FOR;
		
		public function Asteroids():void
		{
			instance = this;
			this.addEventListener(Event.ENTER_FRAME, run);
			this.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			this.addEventListener(KeyboardEvent.KEY_UP, keyUp);
			this.focusRect = false;
			
			this.addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:* = null):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, added);
			this.lives = 3;
			this.level = 1;
			this.score = 0;
			this.startLevel();
		}
		
		private function run(e:* = null):void
		{
			stage.focus = this;
			
			for (var i:int = 0; i < rocks.length;++i)
			{
				rocks[i].run();
			}
			for (i = 0; i < bullets.length;++i)
			{
				bullets[i].run();
			}
			ship.visible ? ship.run():this.resurectShip();
			
			if (this.rocks.length == 0)
			{
				nextLevel();
			}
		}
		
		private function resurectShip():void
		{
			if (this.lives > 0)
			{
				if (this.resDelay <= 0)
				{
					this.resDelay = DEAD_FOR;
					this.lives--;
					ship.x = RIGHT / 2;
					ship.y = BOTTOM / 2;
					ship.visible = true;
					ship.speed = 0;
				}
				else
				{
					this.resDelay--;
				}
			}
		}
		
		private function startLevel():void
		{
			for (var i:int = 0; i < this.numRocks; ++i)
			{
				rocks.push(new LargeRock());
			}
		}
		
		private function nextLevel():void
		{
			this.numRocks++;
			this.level++;
			startLevel();
		}
		
		private function keyDown(k:KeyboardEvent):void
		{
			switch(k.keyCode)
			{
				case Keyboard.UP:
					this.up = true;
				break;
				case Keyboard.DOWN:
					this.down = true;
				break;
				case Keyboard.LEFT:
					this.left = true;
				break;
				case Keyboard.RIGHT:
					this.right = true;
				break;
				case Keyboard.SPACE:
					this.space = true;
				break;
			}
		}
		
		private function keyUp(k:KeyboardEvent):void
		{
			switch(k.keyCode)
			{
				case Keyboard.UP:
					this.up = false;
				break;
				case Keyboard.DOWN:
					this.down = false;
				break;
				case Keyboard.LEFT:
					this.left = false;
				break;
				case Keyboard.RIGHT:
					this.right = false;
				break;
				case Keyboard.SPACE:
					this.space = false;
				break;
			}
		}
		
		public static function get game():Asteroids
		{
			return instance;
		}
		
		public function get bullets():Vector.<Bullet>
		{
			return this._bullets;
		}
		
		public function get rocks():Vector.<Rock>
		{
			return this._rocks;
		}
		
		public function get ship():Ship
		{
			return this['ship_mc'] as Ship;
		}
		
		public function set up(b:Boolean):void
		{
			ship.up = b;
		}
		
		public function set down(b:Boolean):void
		{
			ship.down = b;
		}
		
		public function set left(b:Boolean):void
		{
			ship.left = b;
		}
		
		public function set right(b:Boolean):void
		{
			ship.right = b;
		}
		
		public function set space(b:Boolean):void
		{
			ship.space = b;
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
		
	}
}