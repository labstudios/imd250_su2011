package com.Asteroids
{
	public class MediumRock extends Rock
	{
		
		
		public function MediumRock():void
		{
			this.speed = this.randomSpeed(Rock.MEDIUM_SPEED);
		}
	}
}