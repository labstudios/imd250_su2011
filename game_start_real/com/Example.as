package com
{
	import com.Master;
	
	public class Example extends Master
	{
		
		public function Example():void
		{
			
		}
		
		override protected function ready():void
		{
			super.ready();
			trace("yipppee");
		}
	}
}