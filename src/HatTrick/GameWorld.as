package HatTrick 
{
	import net.flashpunk.World;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Jeffrey Johnson
	 */
	public class GameWorld extends World 
	{
		public static var adventurer:Adventuter;
		public static var hat:Hat;
		
		public function GameWorld() 
		{
			super();
			
			for (var i:int = 0; i < Level.entities.length; i++)
			{
				add(Level.entities[i]);
			}
			
			adventurer = new Adventuter();
			add(adventurer);
			hat = new Hat();
			add(hat);
			add(new Background());
			
			FP.screen.color = 0x333333;
		}
		
	}

}