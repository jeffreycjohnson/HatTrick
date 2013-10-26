package HatTrick 
{
	import net.flashpunk.graphics.Spritemap;
	
	/**
	 * ...
	 * @author Jeffrey Johnson
	 */
	public class Lever extends Activator 
	{
		[Embed(source = "../../assets/lever.png")]
		private const image:Class;
		private var sprite:Spritemap = new Spritemap(image);
		
		public function Lever(x:Number=0, y:Number=0) 
		{
			super(x, y, sprite);
			
			type = "Lever";
			collidable = true;
		}
		
	}

}