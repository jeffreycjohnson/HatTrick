package HatTrick 
{
	import net.flashpunk.FP;
	
	/**
	 * Loads the level from Ogmo.
	 */
	public class Level 
	{
		[Embed(source = "../../assets/levels/level_1.oel", mimeType = "application/octet-stream")] public static const testlevel:Class;
		
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
			var targetId:int;
			var object:Object;
			var id:int;
			
			for each (node in xml.Tiles.tile)
			{
				x = node.@x;
				y = node.@y;
				var tilex:int = node.@tx;
				var tiley:int = node.@ty;
				var t:Tile = new Tile(x * Tile.w, y * Tile.h, tilex, tiley);
				entities.push(t);
			}
			
			for each (node in xml.Paintings.tile)
			{
				x = node.@x;
				y = node.@y;
				var paintingx:int = node.@tx;
				var paintingy:int = node.@ty;
				var p:PaintingTile = new PaintingTile(x * PaintingTile.w, y * PaintingTile.h, paintingx, paintingy);
				entities.push(p);
			}
			
			for each (node in xml.Entities.dispenser)
			{
				x = node.@x;
				y = node.@y;
				y -= 4;
				id = node.@id;
				var arrowShooter:ArrowShooter = new ArrowShooter(x, y);
				arrowShooter.id = id;
				entities.push(arrowShooter);
			}
			
			for each (node in xml.Entities.stairs)
			{
				x = node.@x;
				y = node.@y;
				id = node.@id;
				var visible:Boolean = node.@visible == "True";
				var stairs:Staircase = new Staircase(x, y, visible);
				stairs.id = id;
				entities.push(stairs);
			}
			
			for each (node in xml.Entities.goal)
			{
				x = node.@x;
				y = node.@y;
				entities.push(new Goal(x, y));
			}
						
			for each (node in xml.Entities.spike)
			{
				x = node.@x;
				y = node.@y;
				var flipped:Boolean = node.@direction == 3;
				entities.push(new Spikes(x, y, flipped, node.@onbeat, node.@offbeat));
								
				if (node.@offbeat > Metronome.BeatMax) Metronome.BeatMax = node.@offbeat;
			}
			
			for each (node in xml.Entities.pillar)
			{
				x = node.@x;
				y = node.@y;
				id = node.@id;
				var pillar:Pillar = new Pillar(x, y);
				pillar.id = id;
				entities.push(pillar);
			}
			
			for each (node in xml.Entities.floorplate)
			{
				x = node.@x;
				y = node.@y;
				targetId = node.@targetId;
				for each (object in entities)
				{
					if (object is Trap && object.id == targetId)
					{
						entities.push(new Button(x, y, (Trap)(object)));
						break;
					}
				}
			}
			
			for each (node in xml.Entities.lever)
			{
				x = node.@x;
				y = node.@y;
				targetId = node.@targetId;
				var order:int = node.@order;
				for each (object in entities)
				{
					if (object is Trap && object.id == targetId)
					{
						var lever:Lever = new Lever(x, y, (Trap)(object));
						lever.order = order;
						entities.push(lever);
						break;
					}
				}
			}
			
			for each (node in xml.Entities.player)
			{
				x = node.@x;
				y = node.@y;
				GameWorld.adventurer = new Adventurer(x, y);
				GameWorld.hat = new Hat(x, y);
				entities.push(GameWorld.adventurer);
				entities.push(GameWorld.hat);
			}
			
			for each (node in xml.Entities.startclimb)
			{
				x = node.@x;
				y = node.@y;
				var climbHeight:int = node.@climbLength;
				entities.push(new Ladder(x, y, climbHeight));
			}
		}
		
	}

}