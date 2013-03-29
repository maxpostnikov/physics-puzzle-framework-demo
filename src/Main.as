package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import ru.maxpostnikov.engine.Engine;
	import ru.maxpostnikov.engine.ui.screens.ScreenMainMenu;
	import ru.maxpostnikov.game.GameContent;
	import ru.maxpostnikov.game.GameData;
	import ru.maxpostnikov.game.GameLogic;

	/**
	 * ...
	 * @author Max stagefear Postnikov
	 */
	[Frame(factoryClass="Preloader")]
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) 
				init();
			else 
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			Engine.getInstacne().setData(GameData.LEVELS_TOTAL, GameData.SCORE_TIMER, GameData.SCORE_INITIAL, GameData.SCORE_ON_TIMER,
										 GameData.URL_SPONSOR, GameData.URL_MORE_GAMES, GameData.URL_WALKTHROUGH);
			Engine.getInstacne().launch(this, GameContent.SCREENS, GameData.GAME_NAME, GameData.DEBUG);
			//Engine.getInstacne().playSound(GameContent.music);
			Engine.getInstacne().showScreen(ScreenMainMenu.ID);
			Engine.getInstacne().showCursor(GameContent.CURSOR_ARROW_ID);
			
			GameLogic.getInstacne().init();
		}
		
	}

}