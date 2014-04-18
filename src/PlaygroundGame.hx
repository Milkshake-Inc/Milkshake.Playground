package ;

import minigame.MinigameManager;
import milkshake.game.MilkshakeGame;
import network.NetworkManager;

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
}