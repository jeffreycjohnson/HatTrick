package HatTrick 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	
	/**
	 * ...
	 * @author Jeffrey Johnson
	 */
	public class Goal extends Entity 
	{
		[Embed(source = "../../assets/goal.png")]
		private const image:Class;
		private var sprite:Spritemap = new Spritemap(image);
		
		public var activated:Boolean = false;
		
		public function Goal(x:Number=0, y:Number=0) 
		{
			super(x, y, sprite);
			
			type = "Goal";
			collidable = true;
			setHitbox(16, 32);
		}
		
	}

}