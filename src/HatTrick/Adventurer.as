package HatTrick 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	
	/**
	 * The greatest adventurer in all the land.
	 */
	public class Adventurer extends Entity 
	{
		[Embed(source = "../../assets/wisconsin_john.png")]
		private const image:Class;
		private var sprite:Spritemap = new Spritemap(image, 8 * Main.SCALING_FACTOR, 16 * Main.SCALING_FACTOR);
		
		private static const walkspeed:Number = 0.25;
		private static const climbspeed:Number = 0.5;
		private static const stairsspeed:Number = 0.25;
		
		private var count:int = 0;
		
		public var state:int = state_walkright;
		public static const state_walkright:int = 0;
		public static const state_walkleft:int = 1;
		public static const state_ponder:int = 2;
		public static const state_climb:int = 3;
		public static const state_hatpickup:int = 4;
		private var previousstate:int;
		
		public function Adventurer(x:Number=0, y:Number=0) 
		{
			super(x, y, sprite);
			type = "adventurer";
			collidable = true;
			setHitbox(16, 32);
		}
		
		override public function update():void
		{
			if (state == state_walkright)
			{
				x += walkspeed;
				if (collide("tile", x, y) || collide("Pillar", x, y))
				{
					x -= walkspeed;
					state = state_walkleft;
				}
			}
			else if (state == state_walkleft)
			{
				x -= walkspeed;
				if (collide("tile", x, y) || collide("Pillar", x, y))
				{
					x += walkspeed;
					state = state_walkright;
				}
			}
			else if (state == state_ponder)
			{
				trace("ponder");
			}
			else if (state == state_climb)
			{
				y -= climbspeed;
			}
			else if (state == state_hatpickup)
			{
				count++;
				if (count == 60)
				{
					trace("start pickup animation");
				}
				else if (count == 140)
				{
					trace("going back to prev state");
					state = previousstate;
					GameWorld.hat.onHead = true;
				}
			}
		}
		
		public function pickuphat():void
		{
			previousstate = state;
			state = state_hatpickup;
			count = 0;
			// set animation frame to exclamation
			trace("exclamation!");
		}
		
	}

}