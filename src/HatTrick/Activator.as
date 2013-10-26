package HatTrick 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	
	/**
	 * ...
	 * @author Jeffrey Johnson
	 */
	public class Activator extends Entity 
	{
		private var boundTrap:Trap;
		
		public function Activator(x:Number=0, y:Number=0, trap:Trap=null) 
		{
			super(x, y);
			boundTrap = trap;
		}
		
		override public function update():void 
		{
			if (collide("adventurer", x, y))
			{
				activate();
			}
			super.update();
		}
		
		public function activate():void 
		{
			boundTrap.activate();
		}
		
	}

}