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
		
		
	}
	
	override public function boot(width:Float, height:Float):Void 
	{
		super.boot(width, height);
		
		networkManager = new NetworkManager(sceneManager);

		sceneManager.addScene("roomListScene", new RoomListScene(core, networkManager));
		sceneManager.addScene("lobbyScene", new LobbyScene(networkManager));
		sceneManager.addScene("startMenu", new StartMenuScene(core));
		sceneManager.addScene("game", new PlaygroundScene(core));
		
		sceneManager.changeScene("game");
	}


	override public function update(delta:Float):Void
	{
		super.update(delta);
	}
}