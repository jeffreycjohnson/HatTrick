package HatTrick 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	
	/**
	 * ...
	 * @author Jeffrey Johnson
	 */
	public class Trap extends Entity 
	{
		public var id:int;
		
		public function Trap(x:Number=0, y:Number=0, graphic:Graphic=null) 
		{
			super(x, y, graphic);
			
		}
		
		public function activate():void
		{
			
		}
		
	}

}