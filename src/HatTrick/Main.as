package HatTrick
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	[SWF(width="640", height="320", frameRate = "-1", backgroundColor="#000000")]
	
	/**
	 * Entry point into the game.
	 */
	public class Main extends Engine
	{
		public static const SCREEN_WIDTH:int = 320;
		public static const SCREEN_HEIGHT:int = 160;
		public static const SCALING_FACTOR:int = 2;
		
		public function Main():void 
		{
			super(SCREEN_WIDTH, SCREEN_HEIGHT, 60, true);
			FP.screen.scale = SCALING_FACTOR;
		}
		
		override public function init():void
		{
			Level.init();
			FP.world = new GameWorld();
		}
	}
}