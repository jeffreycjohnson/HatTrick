package HatTrick 
{
	import net.flashpunk.graphics.Spritemap;
	
	/**
	 * ...
	 * @author Jeffrey Johnson
	 */
	public class Staircase extends Trap 
	{
		[Embed(source = "../../assets/stairs.png")]
		private const image:Class;
		private var sprite:Spritemap = new Spritemap(image);
		
		public function Staircase(x:Number=0, y:Number=0, visible:Boolean=false) 
		{
			super(x, y, sprite);
			sprite.visible = visible;
			
			type = "Stairs";
			collidable = visible;
			setHitbox(16, 16);
		}
		
		public override function activate():void
		{
			collidable = true;
			sprite.visible = true;
		}
		
	}

}