package HatTrick 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	
	/**
	 * ...
	 * @author Jeffrey Johnson
	 */
	public class Tile extends Entity 
	{
		[Embed(source = "../../assets/cave_terrain.png")]
		private const image:Class;
		
		public function Tile(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) 
		{
			super(x, y, graphic, mask);
			
		}
		
	}

}