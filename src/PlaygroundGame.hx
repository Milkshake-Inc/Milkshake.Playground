package ;

import minigame.MinigameManager;
import milkshake.game.MilkshakeGame;

class PlaygroundGame extends MilkshakeGame
{
	public function new()
	{
		super();

		sceneManager = new MinigameManager();
	}
	
	
	override public function update(delta:Float):Void 
	{
		super.update(delta);
	}
}