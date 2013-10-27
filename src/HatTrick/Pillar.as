package HatTrick 
{
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	
	/**
	 * ...
	 * @author Jeffrey Johnson
	 */
	public class Pillar extends Trap 
	{
		[Embed(source = "../../assets/pillar.png")]
		private const image:Class;
		private var sprite:Spritemap = new Spritemap(image);
		
		[Embed(source = "../../assets/music/stone.mp3")]
		private const stoneSound:Class;
		private var stoneFX:Sfx;
		
		[Embed(source = "../../assets/music/rumble.mp3")]
		private const rumbleSound:Class;
		private var rumbleFX:Sfx;
		
		public var activated:Boolean = false;
		private static const fallspeed:Number = 0.75;
		private var count:int = 0;
		private static const shakespeed:int = 3;
		private var finaly:Number;
		
		public function Pillar(x:Number=0, y:Number=0) 
		{
			super(x, y, sprite);
			
			type = "Pillar";
			collidable = true;
			setHitbox(16, 160);
			finaly = y + 128;
			
			stoneFX = new Sfx(stoneSound);
			rumbleFX = new Sfx(rumbleSound);
		}
		
		public override function activate():void
		{
			if (!activated)
			{
				activated = true;
			}
		}
		
		override public function update():void
		{
			if (!activated) return;
			
			y += fallspeed;
			if (count == 0 || count == shakespeed * 2)
			{
				x++;
				count = 0;
				
				if (!rumbleFX.playing) rumbleFX.play(0.8);
			}
			if (count == shakespeed)
			{
				x--;
			}
			count++;
			
			if (y >= finaly)
			{
				activated = false;
				y = finaly;
				x--;
				
				stoneFX.play(0.5);
				rumbleFX.stop();
			}
		}
		
	}

}