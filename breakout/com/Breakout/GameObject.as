package com.Breakout
{
	import flash.display.Sprite;
	
	public class GameObject extends Sprite
	{
		
		public function GameObject():void
		{
			
		}
		
		public function get top():Number
		{
			return this.y - (this.height / 2);
		}
		
		public function set top(n:Number):void
		{
			this.y = n + (this.height / 2);
		}
		
		public function get bottom():Number
		{
			return this.y + (this.height / 2);
		}
		
		public function set bottom(n:Number):void
		{
			this.y = n - (this.height / 2);
		}
		
		public function get left():Number
		{
			return this.x - (this.width / 2);
		}
		
		public function set left(n:Number):void
		{
			this.x = n + (this.width / 2);
		}
		
		public function get right():Number
		{
			return this.x + (this.width / 2);
		}
		
		public function set right(n:Number):void
		{
			this.x = n - (this.width / 2);
		}
	}
}