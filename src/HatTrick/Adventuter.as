package HatTrick 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	
	/**
	 * ...
	 * @author Jeffrey Johnson
	 */
	public class Adventuter extends Entity 
	{
		[Embed(source = "../../assets/wisconsin_john.png")]
		private const image:Class;
		private var sprite:Spritemap = new Spritemap(image, 8 * Main.SCALING_FACTOR, 16 * Main.SCALING_FACTOR);
		
		public function Adventuter(x:Number=0, y:Number=0) 
		{
			super(x, y, sprite);
		}
		
	}

}