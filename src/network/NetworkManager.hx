package network ;

import js.node.SocketIoClient;
import js.node.SocketIo;
import network.packets.Player;
import network.packets.room.CreateRoom;
import network.packets.room.Room;
import network.packets.room.RoomList;
import network.packets.room.JoinRoom;

class NetworkManager
{
	private var socket:SocketNamespace;
	
	private var currentRoom:Room;
	
	public function new()
	{
		socket = Io.connect("127.0.0.1:3000");
		
		socket.on("createPlayer", function(data : Player):Void 
		{
			trace("create: " + data.id + " " + data.x + " " + data.y);
		});
		
		socket.on("destroyPlayer", function(data : Player):Void 
		{
			trace("destroy: " + data.id);
		});
		
		socket.on("joinedRoom", function(data : Room):Void
		{
			currentRoom = data;
		});
		
		socket.on("leftRoom", function( data:Dynamic ):Void
		{
			currentRoom = null;
		});
		
		socket.on("playerJoinedRoom", function(data:Player):Void
		{
			currentRoom.currentPlayers += 1;
		});
		
		socket.on("playerLeftRoom", function(data:Player):Void
		{
			currentRoom.currentPlayers -= 1;
		});
	}
	
	public function getRoomList(callback:RoomList -> Void):Void
	{
		socket.on('roomList', callback);
		socket.emit("getRooms");
	}
	
	public function createRoom(_name:String, _password:String, _maxPlayers:Int = 10):Void
	{
		var cr:CreateRoom = { name: _name, password: _password, maxPlayers: _maxPlayers };
		socket.emit("joinRoom", cr);
	}
	
	public function joinRoom(_roomId:String, _password:String):Void
	{
		var jr:JoinRoom = { roomId: _roomId, password: _password };
		socket.emit("joinRoom", jr);
	}
	
	public function leaveRoom():Void
	{
		socket.emit("leaveRoom", currentRoom.name);
	}
}
