package scenes.roomlist;
import milkshake.core.Sprite;
import network.packets.room.Room;

/**
 * ...
 * @author Milkshake-Inc
 */
class RoomSprite extends Sprite
{
	public var selected(default, set):Bool;
	
	public function new(room:Room) 
	{
		super("RoomListItem" + room.name);
	}
	
	public function set_selected(value:Bool):Bool
	{
		return selected = value;
	}
}