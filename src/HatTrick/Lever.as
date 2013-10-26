package HatTrick 
{
	import net.flashpunk.graphics.Spritemap;
	
	/**
	 * ...
	 * @author Jeffrey Johnson
	 */
	public class Lever extends Activator 
	{
		[Embed(source = "../../assets/lever.png")]
		private const image:Class;
		private var sprite:Spritemap = new Spritemap(image, 16);
		
		public function Lever(x:Number=0, y:Number=0, target:Trap=null) 
		{
			super(x, y, sprite, target);
			
			type = "Lever";
			collidable = true;
			
			sprite.frame = 1;
			
			setHitbox(8, 1, -4, -8);
		}
		
		override public function update():void 
		{
			if (collide("Hat", x, y))
			{
				activate();
				sprite.frame = 0;
			}
			super.update();
		}
		
	}

}