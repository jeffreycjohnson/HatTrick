package HatTrick 
{
	import net.flashpunk.graphics.Spritemap;
	
	/**
	 * ...
	 * @author Jeffrey Johnson
	 */
	public class Button extends Activator 
	{
		[Embed(source = "../../assets/button.png")]
		private const image:Class;
		private var sprite:Spritemap = new Spritemap(image);
		
		public function Button(x:Number=0, y:Number=0) 
		{
			super(x, y, sprite);
			
			type = "Button";
			collidable = true;
			
		}
		
	}

}