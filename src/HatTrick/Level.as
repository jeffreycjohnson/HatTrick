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
			var x:int;
			var y:int;
			
			for each (node in xml.Tiles.tile)
			{
				x = node.@x;
				y = node.@y;
				var tilex:int = node.@tx;
				var tiley:int = node.@ty;
				var t:Tile = new Tile(x * Tile.w, y * Tile.h, tilex, tiley);
				entities.push(t);
			}
			
			for each (node in xml.Entities.lever)
			{
				x = node.@x;
				y = node.@y;
				FP.world.add(new Lever(x, y));
			}
			
			for each (node in xml.Entities.dispenser)
			{
				x = node.@x;
				y = node.@y;
				FP.world.add(new ArrowShooter(x, y));
			}
			
			for each (node in xml.Entities.spike)
			{
				x = node.@x;
				y = node.@y;
				FP.world.add(new Spikes(x, y));
			}
			
			for each (node in xml.Entities.floorplate)
			{
				x = node.@x;
				y = node.@y;
				FP.world.add(new Button(x, y));
			}
			
			for each (node in xml.Entities.player)
			{
				x = node.@x;
				y = node.@y;
				FP.world.add(new Adventurer(x, y));
			}
			
			for each (node in xml.Entities.pillar)
			{
				x = node.@x;
				y = node.@y;
				FP.world.add(new Pillar(x, y));
			}
		}
		
	}

}