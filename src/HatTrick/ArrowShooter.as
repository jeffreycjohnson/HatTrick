package HatTrick 
{
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Jeffrey Johnson
	 */
	public class ArrowShooter extends Trap 
	{
		[Embed(source = "../../assets/arrow_shooter_inset.png")]
		private const image:Class;
		private var sprite:Spritemap = new Spritemap(image);
		
		private var fired:Boolean = false;
		
		public function ArrowShooter(x:Number=0, y:Number=0) 
		{
			super(x, y, sprite);
			
		}
		
		public override function activate():void
		{
			if(!fired)
				FP.world.add(new Arrow(x, y));
			fired = true;
		}
		
	}

}