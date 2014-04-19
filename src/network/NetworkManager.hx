package network;
import js.node.SocketIo.SocketNamespace;
import js.node.SocketIoClient.Io;

/**
 * ...
 * @author Milkshake-Inc
 */
class NetworkManager
{
	private var socket:SocketNamespace;
	
	public function new(url:String) 
	{
		socket = Io.connect(url);
	}
	
}