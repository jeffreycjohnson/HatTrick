package HatTrick 
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	/**
	 * The greatest hat in all the land.
	 */
	public class Hat extends Entity 
	{
		[Embed(source = "../../assets/hat.png")]
		private const image:Class;
		private var sprite:Spritemap = new Spritemap(image);
		
		public var onHead:Boolean = true;
		private var onGround:Boolean = false;
		private var velocity:Point = new Point();
		
		private static const adventureroffset:Point = new Point(0, -3);
		public static const inputkey:int = Key.SPACE;
		
		private static const popyspeed:Number = 0.6;
		private static const fallspeed:Number = 0.4;
		private static const yaccel:Number = 0.03;
		
		private static const popxspeed:Number = 0.4;
		private static const xaccel:Number = 0.05;
		private var centerx:int = 0;
		private var count:int = 0;
		
		public function Hat(x:Number=0, y:Number=0) 
		{
			super(x, y, sprite);
			type = "Hat";
			collidable = true;
			setHitbox(12, 4, -2, -6);
		}
		
		override public function update():void
		{
			if (Input.check(inputkey) && onHead)
			{
				onHead = false;
				count = 0;
				onGround = false;
				velocity.y = -popyspeed;
				if (GameWorld.adventurer.state == Adventurer.state_walkright) velocity.x = -popxspeed;
				else if (GameWorld.adventurer.state == Adventurer.state_walkleft) velocity.x = popxspeed;
				// by default fall backwards, but if on a context sensitive area, fall in the specified direction
				GameWorld.adventurer.pickuphat();
			}
			
			if (onHead)
			{
				x = GameWorld.adventurer.x + adventureroffset.x;
				y = GameWorld.adventurer.y + adventureroffset.y;
				if (sprite.alpha == 1) sprite.alpha = 0;
			}
			else
			{
				if (sprite.alpha == 0) sprite.alpha = 1;
				count++; // animate according to value of count
				if (!onGround)
				{
					velocity.y += yaccel;
					if (velocity.y > fallspeed) velocity.y = fallspeed;
					if (count == 40) velocity.x = 0;
				}
				x += velocity.x;
				y += velocity.y;
				if (y > (GameWorld.adventurer.y + adventureroffset.y) && collide("tile", x, y))
				{
					velocity.x = velocity.y = 0;
					onGround = true;
				}
			}
		}
		
		private function sign(n:Number):Number
		{
			return n / Math.abs(n);
		}
		
		public function deathpopoff():void
		{
			onHead = false;
			count = 0;
			onGround = false;
			velocity.y = -popyspeed;
			if (GameWorld.adventurer.state == Adventurer.state_walkright) velocity.x = -popxspeed;
			else if (GameWorld.adventurer.state == Adventurer.state_walkleft) velocity.x = popxspeed;
		}
		
	}

}