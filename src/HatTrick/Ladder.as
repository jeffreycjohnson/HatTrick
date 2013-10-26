package HatTrick 
{
	import net.flashpunk.Entity;
	
	/**
	 * ...
	 * @author Jeffrey Johnson
	 */
	public class Ladder extends Entity 
	{
		public var climbHeight:int;
		
		public function Ladder(x:Number=0, y:Number=0, tilesToClimb:int=0) 
		{
			super(x, y);
			
			type = "Ladder";
			collidable = true;
			setHitbox(16, 16);
			climbHeight = tilesToClimb;
		}
		
	}

}