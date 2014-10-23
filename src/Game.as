package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.system.fscommand;
	import Bomb;
	
	/**
	 * ...
	 * @author Kevin Boogaard
	 */
	public class Game extends Sprite
	{
		private var totalturrets:int = 1;
		public var turretarray:Array = [];
		private var bulletarray:Array = [];
		private var bullet:Bullet;
		private var Bom:Bomb;
		private var timer:Number = 0;
		
		public function Game()
		{
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.addEventListener(MouseEvent.MOUSE_DOWN, mousedown);
			stage.addEventListener(Event.ENTER_FRAME, loop);
			stage.addEventListener(Bullet.REACHED_LOCATION, removeBullet);
			for (var i:int = 0; i < totalturrets; i++)
			{
				var turret:Turret = new Turret();
				turret.x = stage.stageWidth / (totalturrets) * i;
				turret.y = 500;
				addChild(turret);
				turretarray.push(turret);
			}
		}
		
		private function removeBullet(e:Event):void
		{
			var currentBullet:Bullet = e.target as Bullet;
			if (currentBullet)
			{
				trace(currentBullet);
				removeChild(currentBullet);
			}
		
		}
		
		public function mousedown(e:MouseEvent):void
		{
			trace("click");
			bullet = new Bullet();
			bullet.x = turretarray[0].x;
			bullet.y = turretarray[0].y;
			addChild(bullet);
		}
		
		private function loop(e:Event):void
		{
			if (timer > 20)
			{
				Bom = new Bomb();
				addChild(Bom);
				Bom.x = turretarray[0].x;
				timer = 0;
			}
			timer += 0.5;
			trace(Bomb.live);
			if (Bomb.live == 0)
			{
				removeEventListener(Event.ADDED_TO_STAGE, init);
			}
		}
	
	}

}