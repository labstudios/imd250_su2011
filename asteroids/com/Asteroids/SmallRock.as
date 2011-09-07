package com.Asteroids
{
	public class SmallRock extends Rock
	{
		
		
		public function SmallRock():void
		{
			this.speed = this.randomSpeed(Rock.SMALL_SPEED);
		}
	}
}