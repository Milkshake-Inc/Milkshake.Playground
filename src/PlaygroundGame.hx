package ;

import milkshake.game.MilkshakeGame;
import network.NetworkManager;
import scenes.roomlist.RoomListScene;
import scenes.StartMenuScene;

class PlaygroundGame extends MilkshakeGame
{
	public var networkManager:NetworkManager;

	public function new()
	{
		super();
		networkManager = new NetworkManager();

		sceneManager.addScene("serverListScene", new RoomListScene(networkManager));
		sceneManager.addScene("startMenu", new StartMenuScene());
	}


	override public function update(delta:Float):Void
	{
		super.update(delta);
	}
}