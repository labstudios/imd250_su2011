package com.Asteroids
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import com.Asteroids.Game;
	
	public class Asteroids extends Sprite
	{
		public static const LEFT:Number = 0;
		public static const TOP:Number = 0;
		public static const RIGHT:Number = 400;
		public static const BOTTOM:Number = 400;
		public static const DEAD_FOR:int = 50;
		public static const EXTRA_LIFE:int = 1500;
		public static const TELEPORTS_PER_LIFE:int = 3;
		private static var instance:Asteroids;
		
		private var _bullets:Vector.<Bullet> = new Vector.<Bullet>();
		private var _rocks:Vector.<Rock> = new Vector.<Rock>();
		private var numRocks:int = 3;
		private var resDelay:int = DEAD_FOR;
		private var extraLife:int = 0;
		private var teleport:Boolean = true;
		
		public function Asteroids():void
		{
			instance = this;
			this.addEventListener(Event.ENTER_FRAME, run);
			this.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			this.addEventListener(KeyboardEvent.KEY_UP, keyUp);
			this.focusRect = false;
			
			this.addEventListener(Event.ADDED_TO_STAGE, added);
			this.addEventListener(Event.REMOVED_FROM_STAGE, killMe);
		}
		
		private function added(e:* = null):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, added);
			this.lives = 3;
			this.level = 1;
			this.score = 0;
			this.teleports = TELEPORTS_PER_LIFE;
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
					ship.invincible = true;
					this.teleports = TELEPORTS_PER_LIFE;
				}
				else
				{
					this.resDelay--;
				}
			}
			else
			{
				Game.game.itsOver();
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
		
		override public function addChild(child:DisplayObject):DisplayObject
		{
			if (child is Rock)
			{
				return this.asteroidsContainer.addChild(child);
			}
			else if (child is Bullet)
			{
				return this.bulletsContainer.addChild(child);
			}
			else
			{
				return super.addChild(child);
			}
		}
		
		override public function removeChild(child:DisplayObject):DisplayObject
		{
			if (child is Rock)
			{
				return this.asteroidsContainer.removeChild(child);
			}
			else if (child is Bullet)
			{
				return this.bulletsContainer.removeChild(child);
			}
			else
			{
				return super.removeChild(child);
			}
		}
		
		public function killMe(e:* = null):void
		{
			this.removeEventListener(Event.ENTER_FRAME, run);
			this.removeEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			this.removeEventListener(KeyboardEvent.KEY_UP, keyUp);
			this.removeEventListener(Event.REMOVED_FROM_STAGE, killMe);
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
		
		public function get asteroidsContainer():Sprite
		{
			return this['asteroids_mc'] as Sprite;
		}
		
		public function get bulletsContainer():Sprite
		{
			return this['bullets_mc'] as Sprite;
		}
		
		public function set up(b:Boolean):void
		{
			ship.up = b;
		}
		
		public function set down(b:Boolean):void
		{
			if (this.teleports > 0 && this.teleport)
			{
				this.teleport = false;
				ship.down = b;
				this.teleports--;
			}
			else
			{
				ship.down = false;
				this.teleport = true;
			}
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
		
		public function get teleports():int
		{
			return int(teleports_txt.text);
		}
		
		public function set teleports(n:int):void
		{
			teleports_txt.text = n.toString();
		}
		
		public function get score():int
		{
			return int(score_txt.text);
		}
		
		public function set score(n:int):void
		{
			this.extraLife += n - this.score;
			while (this.extraLife > EXTRA_LIFE)
			{
				this.lives++;
				this.extraLife -= EXTRA_LIFE;
			}
			score_txt.text = n.toString();
		}
		
	}
}