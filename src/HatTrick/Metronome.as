package HatTrick 
{
	// this is a static class
	public class Metronome 
	{
		public static var Beat:Number = 0;
		public static var BeatMax:Number = 2;
		
		private static var count:Number = 0;
		
		// number of frames between each beat
		private static const INTERVAL:Number = 30;
		
		public static function Update():void
		{
			count ++;
			
			if (count % INTERVAL == 0)
			{
				if (++Beat > BeatMax) Beat = 1;
				
				trace(Beat == 1 ? "onbeat" : "offbeat", Beat);
			}
			
			
		}
			
	}

}