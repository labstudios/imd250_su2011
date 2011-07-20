package com
{
	import flash.display.Sprite;
	import flash.events.Event;
	import com.Master;
	
	public class Ball extends Sprite
	{
		public static var numBalls:int = 0;
		
		public function Ball():void
		{
			numBalls++;
			Master.addBall(this);
			//this.addEventListener(Event.ENTER_FRAME, run);
		}
		
		public function run(e:* = null):void
		{
			//trace(this.name, flavor);
			this.x++;
			this.y++;
		}
	}
}