package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Kevin Boogaard
	 */
	public class Turret extends Sprite
	{
		private var asset:tower = new tower();
		
		public function Turret()
		{
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addChild(asset);
			addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function loop(e:Event):void
		{
			this.rotation = Math.atan2(stage.mouseY - this.y, stage.mouseX - this.x) * 180 / Math.PI;
		}
	
	}

}