package ;

import milkshake.game.MilkshakeGame;
import network.NetworkManager;
import scenes.lobby.LobbyScene;
import scenes.roomlist.RoomListScene;
import scenes.StartMenuScene;

class PlaygroundGame extends MilkshakeGame
{
	public var networkManager:NetworkManager;

	public function new()
	{
		super();
		networkManager = new NetworkManager(sceneManager);

		sceneManager.addScene("roomListScene", new RoomListScene(networkManager));
		sceneManager.addScene("lobbyScene", new LobbyScene(networkManager));
		sceneManager.addScene("startMenu", new StartMenuScene());
	}


	override public function update(delta:Float):Void
	{
		super.update(delta);
	}
}