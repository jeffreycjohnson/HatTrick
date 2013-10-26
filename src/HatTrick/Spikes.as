package HatTrick 
{
	import net.flashpunk.graphics.Spritemap;
	
	/**
	 * ...
	 * @author Jeffrey Johnson
	 */
	public class Spikes extends Trap 
	{
		[Embed(source = "../../assets/spikes.png")]
		private const image:Class;
		private var sprite:Spritemap = new Spritemap(image);
		
		public function Spikes(x:Number=0, y:Number=0) 
		{
			super(x, y, sprite);
			
		}
		
	}

}