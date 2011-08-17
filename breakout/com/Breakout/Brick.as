package com.Breakout
{
	
	public class Brick extends GameObject
	{
		public static const WIDTH:Number = 34;
		public static const HEIGHT:Number = 14;
		public static const SPACE:Number = 2;
		private var hits:int = 1;
		private var points:Number = 50;
		
		public function Brick(xPos:Number, yPos:Number, hits:int = 1):void
		{
			this.x = xPos;
			this.y = yPos;
			this.hits = hits;
			Game.game.addChild(this);
		}
		
		public function hit():void
		{
			this.hits--;
			if (this.hits <= 0)
			{
				Game.game.addScore(this.points);
				this.remove();
			}
		}
		
		private function remove():void
		{
			Game.game.brickDestroyed(this);
			Game.game.removeChild(this);
		}
	}
}