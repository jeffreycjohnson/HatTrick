package HatTrick 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	
	/**
	 * ...
	 * @author Jeffrey Johnson
	 */
	public class Arrow extends Entity 
	{
		[Embed(source = "../../assets/arrow.png")]
		private const image:Class;
		private var sprite:Spritemap = new Spritemap(image);
		
		public function Arrow(x:Number=0, y:Number=0) 
		{
			super(x, y, sprite);
			
			type = "Arrow";
			collidable = true;
			setHitbox(16, 8);
		}
		
		override public function update():void 
		{
			x -= 3;
			super.update();
		}
		
	}

}