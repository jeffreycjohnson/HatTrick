package HatTrick 
{
	import net.flashpunk.graphics.Spritemap;
	
	/**
	 * ...
	 * @author Jeffrey Johnson
	 */
	public class Button extends Activator 
	{
		[Embed(source = "../../assets/button.png")]
		private const image:Class;
		private var sprite:Spritemap = new Spritemap(image);
		
		public function Button(x:Number=0, y:Number=0, target:Trap=null) 
		{
			super(x, y, sprite, target);
			
			type = "Button";
			collidable = true;
			
			setHitbox(8, 8, -4);
		}
		
		override public function update():void 
		{
			if (collide("adventurer", x, y))
			{
				activate();
			}
			else if (collide("Hat", x, y))
			{
				activate();
			}
			super.update();
		}
		
	}

}