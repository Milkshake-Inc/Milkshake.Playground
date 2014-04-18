package ;

import milkshake.game.scene.SceneManager;
import minigame.MinigameManager;
import milkshake.game.MilkshakeGame;
import network.NetworkManager;
import pixi.Stage;

class PlaygroundGame extends MilkshakeGame
{
	public var networkManager:NetworkManager;

	public function new()
	{
		super();
	}
	
	override public function setStage(stage:Stage):Void 
	{
		sceneManager = new MinigameManager(core);
		networkManager = new NetworkManager();
		
		super.setStage(stage);		
	}

	override public function update(delta:Float):Void
	{
		super.update(delta);
	}
}