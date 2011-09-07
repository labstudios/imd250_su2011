package com.Asteroids
{
	import com.Master
	
	public class Game extends Master
	{
		public static var instance:Game;
		private var finalScore:Number;
		
		public function Game():void
		{
			Game.instance = this;
		}
		
		override public function gotoEnd(e:* = null):void
		{
			if (this.currentFrameLabel == "game")
			{
				this.finalScore = Asteroids.game.score;
			}
			super.gotoEnd(e);
		}
		
		override protected function buildEnd():void
		{
			super.buildEnd();
			score_txt.text = this.finalScore.toString();
		}
		
		public function itsOver():void
		{
			this.gotoEnd();
		}
		
		public static function get game()
		{
			return Game.instance;
		}
	}
}