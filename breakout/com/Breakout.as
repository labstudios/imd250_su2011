package com
{
	import com.Master;
	import flash.events.Event;
	
	public class Breakout extends Master
	{
		private static const MAX_MULT:Number = 5;
		private static const MIN_MULT:Number = 0.5;
		private var range:RegExp = /[0-5]/;
		private var lives:int = 0;
		private var scoreMult:Number = 1;
		
		
		public function Breakout():void
		{
			
		}
		
		override protected function ready():void
		{
			super.ready();
		}
		
		override public function gotoGame(e:* = null):void
		{
			if (range.test(balls_txt.text))
			{
				lives = int(balls_txt.text);
				scoreMult = MAX_MULT - lives;
				scoreMult = scoreMult < MIN_MULT ? MIN_MULT:scoreMult;
				super.gotoGame();
			}
			else
			{
				trace("Between 0 and 5");
			}
		}
		
		override protected function buildLanding():void
		{
			super.buildLanding();
			balls_txt.addEventListener(Event.CHANGE, filterText);
		}
		
		private function filterText(e:* = null):void
		{
			if (!range.test(balls_txt.text) && balls_txt.text != "")
			{
				balls_txt.text = "";
			}
		}
		
		public function get startingLives():int
		{
			return this.lives;
		}
		
		public function get scoreMultiplier():Number
		{
			return this.scoreMult;
		}
	}
}