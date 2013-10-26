package HatTrick
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	[SWF(width="756", height="512", frameRate = "-1", backgroundColor="#000000")]
	
	/**
	 * Entry point into the game.
	 */
	public class Main extends Engine
	{	
		public function Main():void 
		{
			super(756, 512, 60, true);
		}
		
		override public function init():void
		{
		}
	}
}