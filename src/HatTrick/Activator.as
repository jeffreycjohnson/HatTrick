package HatTrick 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.Mask;
	
	/**
	 * ...
	 * @author Jeffrey Johnson
	 */
	public class Activator extends Entity 
	{
		private var boundTrap:Trap;
		
		public function Activator(x:Number=0, y:Number=0, sprite:Spritemap=null, trap:Trap=null) 
		{
			super(x, y, sprite);
			boundTrap = trap;
		}
		
		public function activate():void 
		{
			boundTrap.activate();
		}
		
	}

}