package network.handlers;
import js.node.SocketIo.SocketNamespace;
import milkshake.game.scene.SceneManager;
import network.packets.room.GameUpdate;

/**
 * ...
 * @author Milkshake-Inc
 */
class GameHandler extends AbstractHandler
{

	public function new(socket:SocketNamespace, sceneManager:SceneManager, roomHandler:RoomHandler ) 
	{
		super(socket);
		
		socket.on("startGame", function(data:Dynamic):Void
		{
			sceneManager.changeScene("playgroundScene");
		});
		
		socket.on("gameUpdate", function(data:GameUpdate):Void
		{
			for (player in data.players)
			{
				//TODO do stuff
			}
		});
		
		socket.on("endGame", function(data:Dynamic):Void
		{
			roomHandler.leaveRoom();
		});
	}
	
}