package scenes.roomlist;
import milkshake.core.GameObject;
import milkshake.core.Sprite;
import milkshake.core.Text;
import milkshake.game.scene.Scene;
import milkshake.IGameCore;
import network.NetworkManager;
import milkshake.IGameCore;
import network.handlers.RoomHandler;
import network.MilkshakeNetworkManager;
import network.packets.room.RoomList;
import pixi.InteractionData;

/**
 * ...
 * @author Milkshake-Inc
 */
class RoomListScene extends Scene
{
	private var roomListGameObject:RoomListGameObject;
	
	private var roomHandler:RoomHandler;

<<<<<<< .mine
	public function new(core:IGameCore, networkManager:NetworkManager)
=======
	public function new(game:IGameCore, networkManager:MilkshakeNetworkManager)
>>>>>>> .theirs
	{
<<<<<<< .mine
		super(core, "RoomListScene");
		this.networkManager = networkManager;
		networkManager.onRoomsLoadedCallback = onRoomsLoaded;
=======
		super(game, "RoomListScene");
		this.roomHandler = networkManager.roomHandler;
		roomHandler.onRoomsLoadedCallback = onRoomsLoaded;
>>>>>>> .theirs
		
		var text = new Text("Room List");
		text.x = 400;
		text.y = 30;
		addNode(text);
		
		roomListGameObject = new RoomListGameObject();
		roomListGameObject.x = 300;
		roomListGameObject.y = 100;
		addNode(roomListGameObject);
		
		var joinRoomButton:Button = new Button(250, 50, "Join Room", 0xA9F5A9, 0x58FA58);
		joinRoomButton.x = 230;
		joinRoomButton.y = 600;
		joinRoomButton.displayObject.click = function(data:InteractionData):Void
		{
			roomHandler.joinRoom(roomListGameObject.currentRoomSelected.room.name);
		}
		addNode(joinRoomButton);
		
		var createRoomButton:Button = new Button(250, 50, "Create Room", 0xA9F5A9, 0x58FA58);
		createRoomButton.x = 580;
		createRoomButton.y = 600;
		addNode(createRoomButton);
		
		loadRooms();
	}
	
	function loadRooms() 
	{
		roomHandler.getRoomList();
	}
	
	function onRoomsLoaded(data:RoomList):Void
	{
		roomListGameObject.setRooms(data);
	}


	override public function update(delta:Float)
	{
		super.update(delta);
	}
	
}