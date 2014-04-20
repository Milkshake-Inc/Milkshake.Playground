package network.handlers;
import js.node.SocketIo.SocketNamespace;

/**
 * ...
 * @author Milkshake-Inc
 */
class AbstractHandler
{
	private var socket:SocketNamespace;

	public function new(socket:SocketNamespace) 
	{
		this.socket = socket;
	}
	
}