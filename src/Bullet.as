package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Kevin Boogaard
	 */
	public class Bullet extends Sprite
	{
		public static const REACHED_LOCATION:String = "reached_location";
		
		private var bullet:rocket = new rocket;
		public var coll:Boolean = false;
		
		public function Bullet()
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
			addChild(bullet);
			trace(bullet);
		}
		
		private function loop(e:Event):void
		{
			if (this != null)
			{
				if (this.y == stage.mouseY)
				{
					dispatchEvent(new Event(REACHED_LOCATION, true));
					removeEventListener(Event.ENTER_FRAME, loop);
				}
				else
				{
					this.x -= (this.x - stage.mouseX) / 1.2;
					this.y -= (this.y - stage.mouseY) / 1.2;
				}
			}
		}
	}
}