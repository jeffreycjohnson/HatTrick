package HatTrick 
{
	import net.flashpunk.graphics.Spritemap;
	
	/**
	 * ...
	 * @author Jeffrey Johnson
	 */
	public class Pillar extends Trap 
	{
		[Embed(source = "../../assets/pillar.png")]
		private const image:Class;
		private var sprite:Spritemap = new Spritemap(image);
		
		public function Pillar(x:Number=0, y:Number=0) 
		{
			super(x, y, sprite);
			
			type = "Pillar";
			collidable = true;
			setHitbox(16, 160);
		}
		
	}

}