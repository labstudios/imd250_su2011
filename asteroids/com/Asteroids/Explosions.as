package com.Asteroids
{
	import flash.display.Sprite;
	
	public class Explosions extends Sprite
	{
		public static var exinstance:Explosions;
		
		public function Explosions():void
		{
			exinstance = this;
		}
		
		public static function create(x:Number, y:Number):void
		{
			var explode:Explode = new Explode();
			explode.x = x;
			explode.y = y;
			exinstance.addChild(explode);
		}
	}
}