package HatTrick 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.Sfx;
	import net.flashpunk.utils.Input;
	
	/**
	 * The greatest adventurer in all the land.
	 */
	public class Adventurer extends Entity 
	{
		[Embed(source = "../../assets/wisconsin_john.png")]
		private const image:Class;
		[Embed(source = "../../assets/wisconsin_ded.png")]
		private const ded:Class;
		private var sprite:Spritemap = new Spritemap(image, 16, 32);
		
		[Embed(source = "../../assets/music/alert.mp3")]
		private const alertSound:Class;
		private var alertFX:Sfx;
		
		private static const walkspeed:Number = 0.25;
		private static const climbspeed:Number = 0.5;
		private static const stairsspeed:Number = 0.25;
		
		private var count:int = 0;
		private static const walkanimspeed:Number = 15;
		private static const climbanimspeed:Number = 15;
		private static const deathspeed1:int = 40;
		private static const deathspeed2:int = 40;
		private var deadbody:Entity;
		private static const wintime:int = 180;
		
		public var state:int = state_walkright;
		public static const state_walkright:int = 0;
		public static const state_walkleft:int = 1;
		public static const state_ponder:int = 2;
		public static const state_climb:int = 3;
		public static const state_hatpickup:int = 4;
		public static const state_death:int = 5;
		public static const state_winrar:int = 6;
		private var previousstate:int;
		private var toClimb:int;
		
		public function Adventurer(x:Number=0, y:Number=0) 
		{
			super(x, y, sprite);
			type = "adventurer";
			collidable = true;
			setHitbox(16, 32);
			
			alertFX = new Sfx(alertSound);
		}
		
		override public function update():void
		{
			if (state == state_walkright || state == state_walkleft)
			{
				if (count == walkanimspeed) sprite.setFrame(1, 0);
				else if (count == walkanimspeed * 2 || count == 0)
				{
					sprite.setFrame(0, 0);
					count = 0;
				}
				count++;
				if (collide("Stairs", x, y))
				{
					y -= walkspeed;
				}
			}
			if (state != state_hatpickup && collide("Arrow", x, y))
			{
				die();
			}
			if (collide("Goal", x, y))
			{
				state = state_winrar;
				count = 0;
				sprite.setFrame(0, 5);
				GameWorld.goal.activate();
			}

			var collidedObject:Entity;
			if (state == state_walkright)
			{
				x += walkspeed;
				if (collide("Ladder", x, y))
				{
					if ((collidedObject = collide("Ladder", x - 16, y)))
					{
						previousstate = state;
						state = state_climb;
						toClimb = 32 * (Ladder)(collidedObject).climbHeight;
						count = 0;
					}
				}
				else if (collide("tile", x, y) || collide("Pillar", x, y))
				{
					x -= walkspeed;
					state = state_walkleft;
					sprite.flipped = true;
				}
			}
			else if (state == state_walkleft)
			{
				x -= walkspeed;
				if (collide("Ladder", x, y))
				{
					if ((collidedObject = collide("Ladder", x + 16, y)))
					{
						previousstate = state;
						state = state_climb;
						toClimb = 32 * (Ladder)(collidedObject).climbHeight;
						sprite.setFrame(0, 2);
						sprite.flipped = true;
					}
				}
				else if (collide("tile", x, y) || collide("Pillar", x, y))
				{
					x += walkspeed;
					state = state_walkright;
					sprite.flipped = false;
				}
			}
			else if (state == state_ponder)
			{
				trace("ponder");
			}
			else if (state == state_climb)
			{
				if (count == climbanimspeed * 2 || count == 0)
				{
					sprite.setFrame(0, 2);
					sprite.flipped = false;
					count = 0;
				}
				else if (count == climbanimspeed)
				{
					sprite.setFrame(0, 2);
					sprite.flipped = true;
				}
				count++;
				toClimb -= climbspeed;
				y -= climbspeed;
				if (toClimb <= 0)
				{
					y += toClimb;
					state = previousstate;
					if (state == state_walkleft) sprite.flipped = true;
					else if (state == state_walkright) sprite.flipped = false;
				}
			}
			else if (state == state_hatpickup)
			{
				if (count == 0)
				{
					sprite.setFrame(0, 1);
					
					alertFX.play();
				}
				if (count == 60)
				{
					sprite.setFrame(0, 3);
				}
				else if (count == 120)
				{
					state = previousstate;
					GameWorld.hat.onHead = true;
					count = 0;
					sprite.setFrame(0, 0);
				}
				count++;
			}
			else if (state == state_death)
			{
				if (count == deathspeed1)
				{
					sprite.alpha = 0;
					deadbody = new Entity(x - 8, y + 16, new Image(ded))
					FP.world.add(deadbody);
				}
				else if (count == deathspeed2)
				{
					FP.world.remove(deadbody);
				}
				count++;
			}
			else if (state == state_winrar)
			{
				count++;
				if (count == wintime)
				{
					trace("done");
				}
			}
		}
		
		public function die():void
		{
			state = state_death;
			sprite.setFrame(0, 4);
			count = 0;
			GameWorld.hat.deathpopoff();
		}
		
		public function pickuphat():void
		{
			previousstate = state;
			state = state_hatpickup;
			count = 0;
		}
		
	}

}