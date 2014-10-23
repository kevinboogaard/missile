package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Kevin Boogaard
	 */
	public class Bomb extends Sprite
	{
		public var Bom:bom = new bom;
		public static var live:int = 10;
		private var timer:int = 0;
		
		public function Bomb()
		{
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.ENTER_FRAME, loop);
			addChild(Bom);
		}
		
		private function loop(e:Event):void
		{
			this.y += 5;
			if (timer == 20)
			{
				if (this.y > stage.stageHeight)
				{
					live--;
				}
				timer = 0;
			}
			timer ++;
			trace(timer);
		}
	
	}
}