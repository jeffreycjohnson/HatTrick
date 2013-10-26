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
			
			adventurer = new Adventuter(64, 144);
			add(adventurer);
			hat = new Hat();
			add(hat);
			add(new Background());
			
			FP.screen.color = 0x333333;
		}
		
		override public function update():void
		{
			super.update();
			// additional logic here
		}
		
	}

}