package HatTrick 
{
	import net.flashpunk.FP;
	
	/**
	 * Loads the level from Ogmo.
	 */
	public class Level 
	{
		[Embed(source = "../../assets/levels/level_test.oel", mimeType = "application/octet-stream")] public static const testlevel:Class;
		
		public static var entities:Array;
		public static var width:int;
		public static var height:int;
		
		public static function init():void
		{
			var xml:XML = FP.getXML(testlevel);
			var node:XML;
			var width:int = xml.@width / Tile.w;
			var height:int = xml.@height / Tile.h;
			Level.width = width * Tile.w;
			Level.height = height * Tile.h;
			entities = new Array();
			
			for each (node in xml.Tiles.tile)
			{
				var x:int = node.@x;
				var y:int = node.@y;
				var tilex:int = node.@tx;
				var tiley:int = node.@ty;
				var t:Tile = new Tile(x * Tile.w, y * Tile.h, tilex, tiley);
				entities.push(t);
			}
		}
		
	}

}