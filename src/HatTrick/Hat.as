package HatTrick 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	
	/**
	 * ...
	 * @author Jeffrey Johnson
	 */
	public class Hat extends Entity 
	{
		[Embed(source = "../../assets/hat.png")]
		private const image:Class;
		private var sprite:Spritemap = new Spritemap(image);
		
		public function Hat(x:Number=0, y:Number=0) 
		{
			super(x, y, sprite);
			
		}
		
	}

}