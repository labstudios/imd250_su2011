package com.Asteroids
{
	import flash.display.Sprite;
	import com.Asteroids.Asteroids;
	import flash.geom.Transform;
	import flash.media.Sound;
	import flash.media.SoundTransform;
	import flash.net.SharedObject;
	
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
		
		public function playShot():void
		{
			var shot:Shot = new Shot();
			this.panSound(shot);
		}
		
		public function playTeleport():void
		{
			var port:Teleport = new Teleport();
			this.panSound(port);
		}
		
		public function playExplosion():void
		{
			var explode:Explosion = new Explosion();
			this.panSound(explode);
		}
		
		private function panSound(snd:Sound, vol:Number = 1)
		{
			var trans:SoundTransform;
			var middle:Number = Asteroids.RIGHT / 2;
			var pan:Number;
			
			if (this.x == middle)
			{
				pan = 0;
			}
			else if (this.x < middle)
			{
				pan = - (1 - (x / middle));
			}
			else
			{
				pan = (x / middle) - 1;
			}
			
			trans = new SoundTransform(vol, pan);
			snd.play(0, 0, trans);
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