package com
{
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import com.FrameListener;
	
	public class Master extends MovieClip
	{
		private var timer:Timer = new Timer(500, 0);
		protected var perc:Number = 0;
		protected var frameListen:FrameListener;
		
		public function Master():void
		{
			stop();
			this.frameListen = new FrameListener(this);
			this.frameListen.addListener("landing", buildLanding);
			this.frameListen.addListener("instructions", buildInstructions);
			this.frameListen.addListener("game", buildGame);
			this.frameListen.addListener("end", buildEnd);
			
			this.timer.addEventListener(TimerEvent.TIMER, checkLoad);
			this.timer.start();
		}
		
		protected function checkLoad(e:* = null):void
		{
			this.perc = this.loaderInfo.bytesLoaded / this.loaderInfo.bytesTotal;
			if(perc >= 1)
			{
				timer.stop();
				timer.removeEventListener(TimerEvent.TIMER, checkLoad);
				ready();
			}
			else
			{
				trace(this.perc);
			}
		}
		
		protected function ready():void
		{
			gotoLanding();
		}
		
		protected function gotoFrame(frame:String):void
		{
			gotoAndStop(frame);
		}

		public function gotoLanding(e:* = null):void
		{
			gotoFrame("landing");
		}

		public function gotoInstructions(e:* = null):void
		{
			gotoFrame("instructions");
		}

		public function gotoGame(e:* = null):void
		{
			gotoFrame("game");
		}

		public function gotoEnd(e:* = null):void
		{
			gotoFrame("end");
		}
		
		protected function buildLanding():void
		{
			playBtn.addEventListener(MouseEvent.CLICK, gotoGame);
			instBtn.addEventListener(MouseEvent.CLICK, gotoInstructions);
		}
		
		protected function buildInstructions():void
		{
			playBtn.addEventListener(MouseEvent.CLICK, gotoGame);
			backBtn.addEventListener(MouseEvent.CLICK, gotoLanding);
		}
		
		protected function buildGame():void
		{
			endBtn.addEventListener(MouseEvent.CLICK, gotoEnd);
		}
		
		protected function buildEnd():void
		{
			backBtn.addEventListener(MouseEvent.CLICK, gotoLanding);
		}
		
		public function get playBtn():SimpleButton
		{
			return this["play_btn"] as SimpleButton;
		}
		
		public function get instBtn():SimpleButton
		{
			return getChildByName("inst_btn") as SimpleButton;
		}
		
		public function get backBtn():SimpleButton
		{
			return this["back_btn"] as SimpleButton;
		}
		
		public function get endBtn():SimpleButton
		{
			return this["end_btn"] as SimpleButton;
		}
	}
}