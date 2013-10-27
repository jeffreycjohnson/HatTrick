package HatTrick 
{
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.Sfx;
	
	/**
	 * ...
	 * @author Jeffrey Johnson
	 */
	public class Spikes extends Trap 
	{
		[Embed(source = "../../assets/spikes.png")]
		private const image:Class;
		private var sprite:Spritemap = new Spritemap(image, 16, 32);
		
		[Embed(source = "../../assets/music/spike.mp3")]
		private const spikeSound:Class;
		private var spikeFX:Sfx;
		
		private var onBeat:Number;
		private var offBeat:Number;
		
		private var extended:Boolean;
		
		private var animCount:Number;
		private const FRAME_LENGTH:Number = 4;
		
		public function Spikes(x:Number=0, y:Number=0, flipped:Boolean=false, onBeat:Number=1, offBeat:Number=2) 
		{
			super(x, y, sprite);
			
			type = "Spikes";
			collidable = true;
			setHitbox(12, 32, -2);
			this.y -= 16;
			if (flipped)
			{
				sprite.scaleY = -1
				this.y += 48;
			}
			
			this.onBeat = onBeat;
			this.offBeat = offBeat;
			extended = false;
			
			animCount = -1;
			
			spikeFX = new Sfx(spikeSound);			
		}
		
		override public function update():void
		{
			if (animCount >= 0)
			{
				animCount ++;
				
				if (animCount >= FRAME_LENGTH * 2)
				{
					animCount = -1;
					sprite.frame = extended ? 0 : 2;
					
					if (FP.camera.y < 310 && FP.camera.y > 130) spikeFX.play(0.5);
				}
				
				if (animCount >= FRAME_LENGTH) sprite.frame = 1;
			}
			
			if (Metronome.Beat == onBeat && !extended)
			{
				extended = true;
				animCount = 0;
			}
			else if (Metronome.Beat == offBeat && extended)
			{
				extended = false;
				animCount = 0;
			}
			
			var adventurer:Object;
			if (extended && (adventurer = collide("adventurer", x, y)))
			{
				(Adventurer)(adventurer).die();
			}
		}
		
	}

}