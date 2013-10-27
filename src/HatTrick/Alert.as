package HatTrick 
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Alert extends Entity 
	{
		[Embed (source = "../../assets/dialog.png")]
		private const image:Class;
		private var sprite:Spritemap = new Spritemap(image, 16, 16);
		
		private var animCount:Number;
		
		private var lastAdvState:Number;
		
		private static const adventureroffset:Point = new Point(0, -14);
		
		public function Alert(x:Number=0, y:Number=0) 
		{
			super(x, y, sprite);
			type = "Alert";
			collidable = false;
			setHitbox(16, 16);
			
			animCount = 0;
			sprite.alpha = 0;
			
			lastAdvState = 0;
		}
		
		override public function update():void
		{
			x = GameWorld.adventurer.x + adventureroffset.x;
			y = GameWorld.adventurer.y + adventureroffset.y;
			
			if (animCount > 60)
			{
				animCount = 0;
				sprite.alpha = 0;
			}
			else if (animCount > 0)
			{
				animCount ++;
			}
			else
			{
				if (lastAdvState == GameWorld.adventurer.state) return;
				
				lastAdvState = GameWorld.adventurer.state;
				
				if (lastAdvState == Adventurer.state_hatpickup)
				{
					sprite.alpha = 1;
					
					sprite.frame = 0;
					
					animCount = 1;
				}
				else if (lastAdvState == Adventurer.state_ponder)
				{
					sprite.alpha = 1;
					
					sprite.frame = 1;
					
					animCount = 1;
				}
			}			
		}
		
	}

}