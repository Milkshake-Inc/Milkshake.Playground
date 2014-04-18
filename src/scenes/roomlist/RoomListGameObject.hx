package scenes.roomlist;
import milkshake.core.GameObject;
import network.packets.room.Room;
import network.packets.room.RoomList;
import pixi.InteractionData;
import scenes.roomlist.RoomSprite;

using Lambda;

/**
 * ...
 * @author Milkshake-Inc
 */
class RoomListGameObject extends GameObject
{
	private var ROOM_SPRITE_HEIGHT(default, never):Int = 20;
	
	private var roomList:Array<Room>;
	
	public var currentRoomSelected(default, null):RoomSprite;
	
	public function new() 
	{
		super();
	}
	
	public function setRooms(data:RoomList) 
	{
		//remove old roomButtons
		for (node in nodes)
		{
			removeNode(node);
		}
		
		roomList = data.rooms;
		updateList();
	}
	
	private function updateList() 
	{
		for (room in roomList)
		{
			var roomSprite = new RoomSprite(room);
			var index = roomList.indexOf(room);
			addNode(roomSprite);
			roomSprite.y = ROOM_SPRITE_HEIGHT * index;
			
			roomSprite.displayObject.mouseup = onRoomClicked;
		}
	}
	
	private function onRoomClicked(data:InteractionData):Void
	{
		var roomSprite:RoomSprite = cast(data.target, RoomSprite);
		roomSprite.selected = true;
		currentRoomSelected = roomSprite;
	}
	
	override public function update(deltaTime:Float):Void 
	{
		super.update(deltaTime);
	}
	
}