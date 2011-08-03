package com.Breakout
{
	import flash.display.Sprite;
	import com.Breakout.Ball;
	import flash.events.Event;
	
	public class Game extends Sprite
	{
		public static const LEFT_WALL:Number = 0;
		public static const TOP_WALL:Number = 0;
		public static const RIGHT_WALL:Number = 350;
		public static const BOTTOM:Number = 550;
		
		public function Game():void
		{
			this.addEventListener(Event.ENTER_FRAME, run);
		}
		
		private function run(e:* = null):void
		{
			ball.run();
		}
		
		public function get ball():Ball
		{
			return this["ball_mc"] as Ball;
		}
	}
}