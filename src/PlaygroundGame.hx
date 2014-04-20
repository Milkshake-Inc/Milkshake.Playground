package ;

import milkshake.game.MilkshakeGame;
import network.MilkshakeNetworkManager;
import scenes.lobby.LobbyScene;
import scenes.roomlist.RoomListScene;
import scenes.startmenu.StartMenuScene;

class PlaygroundGame extends MilkshakeGame
{
	public var networkManager:MilkshakeNetworkManager;

	public function new()
	{
		super();
		networkManager = new MilkshakeNetworkManager(sceneManager);
	}
	
	override public function boot(width:Float, height:Float):Void 
	{
		super.boot(width, height);
		
		networkManager = new MilkshakeNetworkManager(sceneManager);

		sceneManager.addScene("startMenu", new StartMenuScene(core, sceneManager));
		sceneManager.addScene("roomListScene", new RoomListScene(core, networkManager));
		sceneManager.addScene("lobbyScene", new LobbyScene(core, networkManager));
		sceneManager.addScene("game", new GameScene(core, sceneManager, networkManager));
		
		sceneManager.changeScene("startMenu");
	}


	override public function update(delta:Float):Void
	{
		super.update(delta);
	}
}