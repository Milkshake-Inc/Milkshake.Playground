<<<<<<< HEAD
package ;

import minigame.MinigameManager;
import milkshake.game.MilkshakeGame;

class PlaygroundGame extends MilkshakeGame
{
	public var networkManager:NetworkManager;

	public function new()
	{
		super();

		sceneManager = new MinigameManager();
		networkManager = new NetworkManager();
	}


	override public function update(delta:Float):Void
	{
		super.update(delta);
	}
=======
package ;

import minigame.MinigameManager;
import milkshake.game.MilkshakeGame;

class PlaygroundGame extends MilkshakeGame
{
	public function new()
	{
		super();

		sceneManager = new MinigameManager(core);
	}
	
	
	override public function update(delta:Float):Void 
	{
		super.update(delta);
	}
>>>>>>> Fixed compile issues
}