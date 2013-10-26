package HatTrick
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	[SWF(width="320", height="240", frameRate = "-1", backgroundColor="#000000")]
	
	/**
	 * Entry point into the game.
	 */
	public class Main extends Engine
	{	
		public function Main():void 
		{
			super(320, 240, 60, true);
		}
		
		override public function init():void
		{
		}
	}
}