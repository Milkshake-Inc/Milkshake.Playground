package network ;

import js.node.SocketIoClient;
import js.node.SocketIo;
import milkshake.game.scene.SceneManager;
import network.handlers.GameHandler;
import network.handlers.RoomHandler;
import network.packets.Player;
import network.packets.room.CreateRoom;
import network.packets.room.GameUpdate;
import network.packets.room.GameUpdate;
import network.packets.room.Room;
import network.packets.room.RoomList;
import network.packets.room.JoinRoom;
import scenes.lobby.LobbyScene;

class MilkshakeNetworkManager extends NetworkManager
{

	private var sceneManager:SceneManager;
	
	public var roomHandler:RoomHandler;
	public var gameHandler:GameHandler;
	
	public function new(sceneManager:SceneManager)
	{
		super("127.0.0.1:3000");
		this.sceneManager = sceneManager;
		
		roomHandler = new RoomHandler(socket, sceneManager);
		gameHandler = new GameHandler(socket, sceneManager, roomHandler);
		
		socket.on("connect", function(data:Dynamic):Void
		{
			roomHandler.getRoomList();
		});
		
		socket.on("disconnect", function(data:Dynamic):Void
		{
			sceneManager.changeScene("roomListScene");
		});
	}
}
