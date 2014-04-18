package ;

import libs.js.node.SocketNamespace;
import libs.js.node.Io;

class NetworkManager
{
	private var socket:SocketNamespace;
	private var uuid:String;

	public function new()
	{
		socket = Io.connect("http://localhost:3000");
		socket.on("user", function( data:Dynamic ):Void { uuid = data.user.id; });
	}
}
