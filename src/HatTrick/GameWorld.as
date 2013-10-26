package HatTrick 
{
	import net.flashpunk.World;
	import net.flashpunk.FP;
	
	/**
	 * Main game world. Made exclusively by Jeffrey Johnson.
	 * @author Jeffrey Johnson
	 */
	public class GameWorld extends World 
	{
		public static var adventurer:Adventurer;
		public static var hat:Hat;
		
		public function GameWorld() 
		{
			super();
			
			for (var i:int = 0; i < Level.entities.length; i++)
			{
				add(Level.entities[i]);
			}
			
			add(new Background());
			
			FP.screen.color = 0x333333;
		}
		
		override public function update():void
		{
			super.update();
			camera.y = Math.min(Level.height - Main.SCREEN_HEIGHT, Math.max(0, adventurer.y + 16 - Main.SCREEN_HEIGHT / 2));
		}
		
	}

}