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
		private static var instance:Asteroids;
		
		private var _bullets:Vector.<Bullet> = new Vector.<Bullet>();
		
		public function Asteroids():void
		{
			instance = this;
			this.addEventListener(Event.ENTER_FRAME, run);
			this.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			this.addEventListener(KeyboardEvent.KEY_UP, keyUp);
			this.focusRect = false;
		}
		
		private function run(e:* = null):void
		{
			stage.focus = this;
			
			for (var i:int = 0; i < bullets.length;++i)
			{
				bullets[i].run();
			}
			ship.run();
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
		
	}
}