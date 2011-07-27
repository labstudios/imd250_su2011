package com
{
	import flash.display.MovieClip;
	import flash.display.FrameLabel;
	
	/**
	 * Enables calling a function when arriving at a specific frame
	 * @author Brent Allen - Riser
	 * @copy Riser 2011
	 */
	public class FrameListener
	{
		private var frameList:Object;
		private var targ:MovieClip;
		
		public function FrameListener(mc:MovieClip = null):void
		{
			if(mc != null)
			{
				this.movieClip = mc;
			}
		}
		
		/**
		 * Adds a listener for the timeline to arrive at the frame label.
		 * Must be called before the timeline plays, otherwise will throw an error.
		 * @param	frameName	the label of the frame
		 * @param	func		the function to call when on the frame
		 */
		public function addListener(frameName:String, func:Function):void
		{
			
			if(this.targ == null)
			{
				throw new Error("Your frame listener does not have a MovieClip to work with.");
			}
			else if(this.targ.currentFrame != 1)
			{
				throw new Error("Listener attempted after the playhead has advanced.");
			}
			else if(frameList[frameName] != undefined)
			{
				this.targ.addFrameScript(frameList[frameName], func);
			}
			else
			{
				throw new Error(frameName + " does not exist in " + this.targ.name + ". Listener rejected.");
			}
		}
		
		/**
		 * Adds a listener for the timeline to arrive at the frame number.
		 * Must be called before the timeline plays, otherwise will throw an error.
		 * @param	frame		the number of the frame
		 * @param	func		the function to call when on the frame
		 */
		public function addListenerByNumber(frame:int, func:Function):void
		{
			if(this.targ == null)
			{
				throw new Error("Your frame listener does not have a MovieClip to work with.");
			}
			else if(this.targ.currentFrame != 1)
			{
				throw new Error("Listener attempted after the playhead has advanced.");
			}
			else if(frame <= this.targ.totalFrames)
			{
				this.targ.addFrameScript(frame-1, func);
			}
			else
			{
				throw new Error(this.targ.name + " only has " + this.targ.totalFrames + ". Listener rejected.");
			}
		}
		
		/**
		 * Clears the frame actions
		 * @param	frameName	the name of the frame to clear
		 */
		public function clearFrame(frameName:String):void
		{
			if(this.targ == null)
			{
				throw new Error("Your frame listener does not have a MovieClip to work with.");
			}
			else if(this.targ.currentFrame != 1)
			{
				throw new Error("Clear attempted after the playhead has advanced.");
			}
			else if(frameList[frameName] != undefined)
			{
				this.targ.addFrameScript(frameList[frameName], null);
			}
			else
			{
				throw new Error(frameName + " does not exist in " + this.targ.name + ". Nullifier rejected.");
			}
		}
		
		/**
		 * Preps the frameList object for class use
		 */
		private function buildFrameList():void
		{
			frameList = new Object();
			for(var i:int = 0; i < targ.currentLabels.length; i++)
			{
				var frameLab:FrameLabel = targ.currentLabels[i];
				frameList[frameLab.name] = frameLab.frame - 1;
			}
		}
		
		/**
		 * Sets the MovieClip that this listener works with
		 */
		public function set movieClip(mc:MovieClip):void
		{
			this.targ = mc;
			buildFrameList();
		}
		
		/**
		 * Gets the MovieClip this listener works with
		 * @return the MovieClip this listener works with
		 */
		public function get movieClip():MovieClip
		{
			return this.targ;
		}
	}
}