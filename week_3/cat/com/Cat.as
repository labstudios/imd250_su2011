package com
{
	import flash.display.MovieClip;
	import com.greensock.TweenLite;
	import com.greensock.plugins.TintPlugin;
	import com.greensock.plugins.TweenPlugin;
	
	public class Cat extends MovieClip
	{
		private static const EYE_TIME:Number = 2;
		private var _eyeColor:int = 0x000000;
		
		public function Cat():void
		{
			TweenPlugin.activate([TintPlugin]);
		}
		
		public function set eyeColor(i:int):void
		{
			this._eyeColor = i;
			TweenLite.to(leftEye, EYE_TIME, { tint:i } );
			TweenLite.to(rightEye, EYE_TIME, { tint:i } );
		}
		
		public function get eyeColor():int
		{
			return this._eyeColor;
		}
		
		override public function set x(value:Number):void
		{
			trace("Meow.", value);
			super.x = value;
		}
	}
}