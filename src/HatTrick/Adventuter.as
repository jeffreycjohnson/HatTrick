package HatTrick 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	
	/**
	 * The greatest adventurer in all the land.
	 */
	public class Adventuter extends Entity 
	{
		[Embed(source = "../../assets/wisconsin_john.png")]
		private const image:Class;
		private var sprite:Spritemap = new Spritemap(image, 8 * Main.SCALING_FACTOR, 16 * Main.SCALING_FACTOR);
		
		private static const walkspeed:Number = 0.5;
		
		public function Adventuter(x:Number=0, y:Number=0) 
		{
			super(x, y, sprite);
			type = "adventurer";
			collidable = true;
		}
		
		override public function update():void
		{
			x += walkspeed;
		}
		
	}

}