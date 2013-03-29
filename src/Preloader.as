package 
{
	import ru.maxpostnikov.engine.ui.Preloader;
	import ru.maxpostnikov.engine.ui.Cursors;
	import ru.maxpostnikov.game.GameData;
	
	/**
	 * ...
	 * @author Max stagefear Postnikov
	 */
	public class Preloader extends  ru.maxpostnikov.engine.ui.Preloader
	{
		
		public function Preloader() 
		{
			super(sPreloader, GameData.URL_SPONSOR, GameData.URL_MORE_GAMES, GameData.URL_WALKTHROUGH, GameData.LOCKED, GameData.ALLOWED_URL);
			
			Cursors.getInstacne().init(stage, new <Class>[Cursor_Arrow, Cursor_Cross]);
			Cursors.getInstacne().showCursor(0);
		}
		
	}
	
}