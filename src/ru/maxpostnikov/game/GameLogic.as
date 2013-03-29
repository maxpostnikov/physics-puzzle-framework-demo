package ru.maxpostnikov.game 
{
	import ru.maxpostnikov.engine.Engine;
	import ru.maxpostnikov.engine.EngineEvent;
	import ru.maxpostnikov.engine.entities.Entity;
	import ru.maxpostnikov.game.entities.EntityProjectile;
	import ru.maxpostnikov.game.entities.EntityTarget;
	/**
	 * ...
	 * @author Max stagefear Postnikov
	 */
	public class GameLogic 
	{
		
		private const _PROJECTILES_TOTAL:int = 1;
		
		private var _isWinning:Boolean;
		private var _targetsTotal:int;
		private var _targetsCollected:int;
		private var _projectilesCreated:int;
		
		private static var _instance:GameLogic;
		
		public function GameLogic(singleton:PrivateClass) 
		{
			_instance = this;
		}
		
		public static function getInstacne():GameLogic 
		{
			return (_instance) ? _instance : new GameLogic(new PrivateClass());
		}
		
		public function init():void 
		{
			Engine.getInstacne().addEventListener(EngineEvent.LOOP_STEP, onLoopStep);
			Engine.getInstacne().addEventListener(EngineEvent.LEVEL_ADDED, onLevelAdded);
			Engine.getInstacne().addEventListener(EngineEvent.ENTITY_ADDED, onEntityAdded);
			Engine.getInstacne().addEventListener(EngineEvent.ENTITY_REMOVED, onEntityRemoved);
			
			Engine.getInstacne().addEventListener(EngineEvent.LEVEL_MOUSE_OUT, onLevelMouseOut);
			Engine.getInstacne().addEventListener(EngineEvent.LEVEL_MOUSE_OVER, onLevelMouseOver);
		}
		
		private function onLevelAdded(e:EngineEvent):void 
		{
			_isWinning = false;
			
			_targetsTotal = 0;
			_targetsCollected = 0;
			_projectilesCreated = 0;
		}
		
		private function onEntityAdded(e:EngineEvent):void 
		{
			var entity:Entity = e.parameter as Entity;
			
			if (entity is EntityTarget)
				_targetsTotal++;
			else if (entity is EntityProjectile)
				_projectilesCreated++;
			
			if (_projectilesCreated > _PROJECTILES_TOTAL)
				Engine.getInstacne().removeFirstEntityOfType(EntityProjectile);
		}
		
		private function onEntityRemoved(e:EngineEvent):void 
		{
			var entity:Entity = e.parameter as Entity;
			
			if (entity is EntityTarget && (entity as EntityTarget).isCollected)
				_targetsCollected++;
			else if (entity is EntityProjectile)
				_projectilesCreated--;
			
			if (_projectilesCreated < 0) _projectilesCreated = 0;
		}
		
		private function onLoopStep(e:EngineEvent):void 
		{
			if (!_isWinning && _targetsTotal != 0 && _targetsTotal == _targetsCollected) {
				_isWinning = true;
				
				Engine.getInstacne().win();
			}
		}
		
		private function onLevelMouseOut(e:EngineEvent):void 
		{
			Engine.getInstacne().showCursor(GameContent.CURSOR_ARROW_ID);
		}
		
		private function onLevelMouseOver(e:EngineEvent):void 
		{
			Engine.getInstacne().showCursor(GameContent.CURSOR_CROSS_ID);
		}
		
	}

}

class PrivateClass { }