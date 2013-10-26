package HatTrick 
{
	import net.flashpunk.graphics.Spritemap;
	
	/**
	 * ...
	 * @author Jeffrey Johnson
	 */
	public class ArrowShooter extends Trap 
	{
		[Embed(source = "../../assets/ArrowShooter.png")]
		private const image:Class;
		private var sprite:Spritemap = new Spritemap(image);
		
		public function ArrowShooter(x:Number=0, y:Number=0) 
		{
			super(x, y, sprite);
			
		}
		
	}

}