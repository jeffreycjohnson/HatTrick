package HatTrick 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import flash.geom.Rectangle;
	
	/**
	 * ...
	 * @author Jeffrey Johnson
	 */
	public class Tile extends Entity 
	{
		[Embed(source = "../../assets/cave_terrain.png")]
		private const tileset:Class;
		
		public static const w:int = 16;
		public static const h:int = 16;
		
		public function Tile(x:Number, y:Number, tilex:int, tiley:int) 
		{
			super(x, y);
			graphic = new Image(tileset, new Rectangle(tilex * w, tiley * h, w, h));
			type = "tile";
			if (!(tilex == 3 && tiley == 2) && !(tilex == 4 && tiley == 2)) collidable = true;
			else collidable = false;
			setHitbox(w, h);
		}
		
	}

}