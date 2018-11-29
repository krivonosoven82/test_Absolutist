package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.net.URLRequest;
	/**
	 * ...
	 * @author yatip
	 */
	public class Main extends Sprite 
	{
		
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
			[Embed(source="gudok.mp3")]
			public var AudioPlay: Class;
			public var myAudio: Sound = new AudioPlay();
			
			public var back:Back = new Back();
			public var fishS:FishSleep = new FishSleep();
			public var fishA:FishActive = new FishActive();
			
			
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.addChild(back);
			back.x = 400;
			back.y = 400;
			back.width = 800;
			back.heith = 600;
			stage.addChild(fishS);
			fishS.x = 300;
			fishS.y = 250;
			fishS.addEventListener(MouseEvent.MOUSE_DOWN, toDownFish);
			stage.addEventListener(MouseEvent.MOUSE_UP, toUpFish);
			
			function toDownFish(e: MouseEvent):void
			{
				stage.removeChild(fishS);
				stage.addChild(fishA);
				fishA.x = mouseX;
				fishA.y = mouseY;
				fishA.startDrag();
				myAudio.play();
				
			}
			function toUpFish(e: MouseEvent):void
			{
				
				stage.removeChild(fishA);
				stage.addChild(fishS);
				fishS.x = mouseX;
				fishS.y = mouseY;
			}		
		
		}
		
	}
	
}