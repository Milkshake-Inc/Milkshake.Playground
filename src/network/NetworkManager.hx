package network ;

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
	
	private var currentRoom:Room;
	private var sceneManager:SceneManager;
	
	public var onRoomsLoadedCallback:RoomList -> Void;
	
	public function new(sceneManager:SceneManager)
	{
		this.sceneManager = sceneManager;
		socket = Io.connect("127.0.0.1:3000");
		
		socket.on("connect", function(data:Dynamic):Void
		{
			getRoomList();
		});
		
		socket.on("disconnect", function(data:Dynamic):Void
		{
			sceneManager.changeScene("roomListScene");
		});
		
		socket.on("joinedRoom", function(data : Room):Void
		{
			currentRoom = data;
			updateLobbyRoom();
			sceneManager.changeScene("lobbyScene");
		});
		
		socket.on("leftRoom", function( data:Dynamic ):Void
		{
			currentRoom = null;
			sceneManager.changeScene("roomListScene");
		});
		
		socket.on("playerJoinedRoom", function(data:Player):Void
		{
			currentRoom.currentPlayers += 1;
			updateLobbyRoom();
		});
		
		socket.on("playerLeftRoom", function(data:Player):Void
		{
			currentRoom.currentPlayers -= 1;
			updateLobbyRoom();
		});
		
		socket.on("refreshRoomList", function(data:Dynamic):Void
		{
			getRoomList();
		});
		
		socket.on("startGame", function(data:Dynamic):Void
		{
			sceneManager.changeScene("playgroundScene");
		});
		
		socket.on("gameUpdate", function(data:GameUpdate):Void
		{
			
		});
		
		socket.on("endGame", function(data:Dynamic):Void
		{
			leaveRoom();
		});
	}
	
	private function updateLobbyRoom():Void
	{
		var lobbyScene:LobbyScene = cast sceneManager.scenes.get("lobbyScene");
		lobbyScene.setRoom(currentRoom);
	}
	
	public function getRoomList():Void
	{
		if (onRoomsLoadedCallback != null)
		{
			socket.on('roomList', onRoomsLoadedCallback);
			socket.emit("getRooms");
		}
	}
	
	public function createRoom(_name:String, _password:String, _maxPlayers:Int = 10):Void
	{
		var cr:CreateRoom = { name: _name, password: _password, maxPlayers: _maxPlayers };
		socket.emit("joinRoom", cr);
	}
	
	public function joinRoom(_name:String, _password:String = ""):Void
	{
		var jr:JoinRoom = { name: _name, password: _password };
		socket.emit("joinRoom", jr);
	}
	
	public function leaveRoom():Void
	{
		socket.emit("leaveRoom", currentRoom.name);
	}
}
