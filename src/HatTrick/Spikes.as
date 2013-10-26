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
		private var sprite:Spritemap = new Spritemap(image, 16);
		
		public function Spikes(x:Number=0, y:Number=0, flipped:Boolean=false) 
		{
			super(x, y, sprite);
			
			type = "Spikes";
			collidable = true;
			this.y -= 16;
			if (flipped)
			{
				sprite.scaleY = -1
				this.y += 48;
			}
		}
		
	}

}