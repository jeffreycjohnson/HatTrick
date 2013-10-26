package HatTrick 
{
	import net.flashpunk.graphics.Spritemap;
	
	/**
	 * ...
	 * @author Jeffrey Johnson
	 */
	public class Spikes extends Trap 
	{
		[Embed(source = "../../assets/spikes.png")]
		private const image:Class;
		private var sprite:Spritemap = new Spritemap(image, 16, 32);
		
		private var onBeat:Number;
		private var offBeat:Number;
		
		private var extended:Boolean;
		
		public function Spikes(x:Number=0, y:Number=0, flipped:Boolean=false, onBeat:Number=1, offBeat:Number=2) 
		{
			super(x, y, sprite);
			
			type = "Spikes";
			collidable = true;
			setHitbox(16, 32);
			this.y -= 16;
			if (flipped)
			{
				sprite.scaleY = -1
				this.y += 48;
			}
			
			this.onBeat = onBeat;
			this.offBeat = offBeat;
			extended = false;
			
			sprite.add("extend", [2, 1, 0], 6, false);
			sprite.add("retract", [0, 1, 2], 6, false);
		}
		
		override public function update():void
		{
			if (Metronome.Beat == onBeat && !extended)
			{
				extended = true;
				sprite.play("extend");
			}
			else if (Metronome.Beat == offBeat && extended)
			{
				extended = false;
				sprite.play("retract");
			}
			var adventurer:Object;
			if ((adventurer = extended && collide("adventurer", x, y)))
			{
				(Adventurer)(adventurer).die();
			}
		}
		
	}

}