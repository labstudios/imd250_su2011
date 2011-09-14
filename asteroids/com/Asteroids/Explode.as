package com.Asteroids
{
	import flash.display.MovieClip;
	import com.FrameListener;
	
	public class Explode extends MovieClip
	{
		private var framel:FrameListener;
		
		public function Explode():void
		{
			framel = new FrameListener(this);
			framel.addListenerByNumber(this.totalFrames, killMe);
		}
		
		private function killMe():void
		{
			if (parent)
			{
				parent.removeChild(this);
			}
		}
	}
}