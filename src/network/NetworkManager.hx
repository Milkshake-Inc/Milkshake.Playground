package network ;

import js.node.SocketIoClient;

import network.packets.CreatePlayer;
import network.packets.DestroyPlayer;



class NetworkManager
{
	public function new()
	{
		var socket = Io.connect("127.0.0.1:3000");
		
		socket.on("createPlayer", function( data : CreatePlayer):Void 
		{
			trace("create: " + data.id + " " + data.x + " " + data.y);
		});
		
		socket.on("destroyPlayer", function( data : DestroyPlayer):Void 
		{
			trace("destroy: " + data.id);
		});
	}
}
