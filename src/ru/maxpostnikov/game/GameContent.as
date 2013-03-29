package ru.maxpostnikov.game 
{
	import flash.media.Sound;
	import ru.maxpostnikov.engine.ui.screens.*;
	/**
	 * ...
	 * @author Max stagefear Postnikov
	 */
	public class GameContent 
	{
		
		public static const SCREENS:Vector.<Screen> = new <Screen>[new ScreenBack(new sBack()), 
																   new ScreenPause(new sPause()), 
																   new ScreenMainMenu(new sMainMenu()), 
																   new ScreenLevelMap(new sLevelMap(), bLevel), 
																   new ScreenReset(new sReset()), 
																   new ScreenCredits(new sCredits()), 
																   new ScreenHUD(new sHUD(), Effect_LevelChange), 
																   new ScreenFail(new sFail()), 
																   new ScreenInterlevel(new sInterlevel()), 
																   new ScreenVictory(new sVictory())];
		
		public static const CURSOR_ARROW_ID:uint = 0;
		public static const CURSOR_CROSS_ID:uint = 1;
		
		/*[Embed(source='/../../ThermoBox 2/Sounds/Cattails.mp3')]
		private static var _music:Class;
		
		[Embed(source='/../../ThermoBox 2/Sounds/sound_drop_1.mp3')]
		private static var _sound:Class;
		
		public static var music:Sound = new _music();
		public static var sound:Sound = new _sound();*/
		
	}

}