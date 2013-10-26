package HatTrick 
{
	import flash.geom.Rectangle;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	
	/**
	 * ...
	 * @author ...
	 */
	public class PaintingTile extends Entity 
	{
		[Embed(source = "../../assets/paintings.png")]
		private const tileset:Class;
		
		public static const w:int = 16;
		public static const h:int = 16;
		
		public function PaintingTile(x:Number, y:Number, tilex:Number, tiley:Number) 
		{
			super(x, y);
			graphic = new Image(tileset, new Rectangle(tilex * w, tiley * h, w, h));
			type = "tile";
			
			setHitbox(w, h);
			
		}
		
	}

}