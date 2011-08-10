package com.Breakout
{
	
	public class Brick extends GameObject
	{
		public static const WIDTH:Number = 34;
		public static const HEIGHT:Number = 14;
		public static const SPACE:Number = 2;
		private var hits:int = 1;
		
		public function Brick(xPos:Number, yPos:Number, hits:int = 1):void
		{
			this.x = xPos;
			this.y = yPos;
			this.hits = hits;
			Game.game.addChild(this);
		}
	}
}