package scenes.roomlist;
import milkshake.core.GameObject;
import milkshake.core.Sprite;
import milkshake.game.scene.Scene;
import network.NetworkManager;
import network.packets.room.RoomList;

/**
 * ...
 * @author Milkshake-Inc
 */
class RoomListScene extends Scene
{
	
	private var assetDir:String = "/scenes/serverListScene/";
	
	private var loadingGameObject:LoadingGameObject;
	private var roomListGameObject:RoomListGameObject;
	
	private var networkManager:NetworkManager;

	public function new(networkManager:NetworkManager)
	{
		super("RoomListScene");
		this.networkManager = networkManager;
		
		
		loadingGameObject = new LoadingGameObject();
		addNode(loadingGameObject);
		
		roomListGameObject = new RoomListGameObject();
		addNode(roomListGameObject);
		roomListGameObject.visible = false;
		
		loadRooms();
	}
	
	function loadRooms() 
	{
		loadingGameObject.visible = true;
		networkManager.getRoomList(onRoomsLoaded);
	}
	
	function onRoomsLoaded(data:RoomList):Void
	{
		loadingGameObject.visible = false;
		roomListGameObject.setRooms(data);
		roomListGameObject.visible = true;
	}


	override public function update(delta:Float)
	{
		loadingGameObject.update(delta);
		super.update(delta);
	}
	
}