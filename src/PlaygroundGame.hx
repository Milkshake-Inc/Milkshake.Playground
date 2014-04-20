package ;

import milkshake.game.MilkshakeGame;
import network.MilkshakeNetworkManager;
import scenes.lobby.LobbyScene;
import scenes.roomlist.RoomListScene;
import scenes.StartMenuScene;

class PlaygroundGame extends MilkshakeGame
{
	public var networkManager:MilkshakeNetworkManager;

	public function new()
	{
		super();
		networkManager = new NetworkManager(sceneManager);
	}
	
	override public function boot(width:Float, height:Float):Void 
	{
		super.boot(width, height);
		
		networkManager = new NetworkManager(sceneManager);

		sceneManager.addScene("roomListScene", new RoomListScene(core, networkManager));
		sceneManager.addScene("lobbyScene", new LobbyScene(core, networkManager));
		sceneManager.addScene("startMenu", new StartMenuScene(core));
		sceneManager.addScene("game", new PlaygroundScene(core));
		
		sceneManager.changeScene("game");
	}


	override public function update(delta:Float):Void
	{
		super.update(delta);
	}
}