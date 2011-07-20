package com
{
	import flash.display.MovieClip;
	import com.Ball;
	import flash.events.Event;
	
	public class Master extends MovieClip
	{
		private static var balls:Array = new Array();
		
		public function Master():void
		{
			this.addEventListener(Event.ENTER_FRAME, run);
		}
		
		public static function addBall(b:Ball):void
		{
			balls.push(b);
		}
		
		private function run(e:* = null):void
		{
			for (var i = 0; i < balls.length;++i)
			{
				(balls[i] as Ball).run();
			}
		}
	}
	
}