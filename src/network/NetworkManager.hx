package network;
import js.node.SocketIo.SocketNamespace;
import js.node.SocketIoClient.Io;

import js.node.SocketIoClient;
import js.node.SocketIo;
import milkshake.game.scene.SceneManager;
import network.packets.Player;
import network.packets.room.CreateRoom;
import network.packets.room.GameUpdate;
import network.packets.room.Room;
import network.packets.room.RoomList;
import network.packets.room.GameUpdate;
import network.packets.room.JoinRoom;
import scenes.lobby.LobbyScene;

class NetworkManager
{
	private var socket:SocketNamespace;
	
	public function new(url:String) 
	{
		socket = Io.connect(url);
	}
	
}