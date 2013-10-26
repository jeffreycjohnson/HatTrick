package HatTrick 
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	
	/**
	 * The greatest hat in all the land.
	 */
	public class Hat extends Entity 
	{
		[Embed(source = "../../assets/hat.png")]
		private const image:Class;
		private var sprite:Spritemap = new Spritemap(image);
		
		private var onHead:Boolean = true;
		private static const adventureroffset:Point = new Point(0, 0);
		
		public function Hat(x:Number=0, y:Number=0) 
		{
			super(x, y, sprite);
		}
		
		override public function update():void
		{
			if (onHead)
			{
				x = GameWorld.adventurer.x + adventureroffset.x;
				y = GameWorld.adventurer.y + adventureroffset.y;
			}
		}
		
	}

}