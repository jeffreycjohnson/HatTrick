package HatTrick 
{
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Jeffrey Johnson
	 */
	public class Pillar extends Trap 
	{
		[Embed(source = "../../assets/pillar.png")]
		private const image:Class;
		private var sprite:Spritemap = new Spritemap(image);
		
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
			}
		}
		
	}

}