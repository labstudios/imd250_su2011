package com.Asteroids
{
	import flash.display.Sprite;
	import com.Asteroids.Asteroids;
	
	public class SpaceObject extends Sprite
	{
		
		protected var vx:Number = 0;
		protected var vy:Number = 0;
		
		public function SpaceObject():void
		{
			
		}
		
		public function run():void
		{
			this.x += this.vx;
			this.y += this.vy;
			
			this.x = this.x > Asteroids.RIGHT ? Asteroids.LEFT:this.x;
			this.x = this.x < Asteroids.LEFT ? Asteroids.RIGHT:this.x;
			this.y = this.y > Asteroids.BOTTOM ? Asteroids.TOP:this.y;
			this.y = this.y < Asteroids.TOP ? Asteroids.BOTTOM:this.y;
		}
		
		public function get speed():Number
		{
			var asq:Number = this.vx * this.vx;
			var bsq:Number = this.vy * this.vy;
			var csq:Number = asq + bsq;
			return Math.sqrt(csq);
		}
		
		public function set speed(n:Number):void
		{
			this.vx = Math.cos(this.rotation * Math.PI / 180) * n;
			this.vy = Math.sin(this.rotation * Math.PI / 180) * n;
		}
		
		public function get direction():Number
		{
			return Math.atan2(vy, vx) * 180 / Math.PI;
		}
	}
}