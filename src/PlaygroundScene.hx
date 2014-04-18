package ;

import milkshake.game.scene.Scene;
import milkshake.core.Sprite;
import milkshake.core.GameObject;

class PlaygroundScene extends Scene
{
	private var bunny:Sprite;

	public function new(id:String="playgroundScene")
	{
		super(id);
		addBunny();
	}

	private function addBunny():Void
	{
		var bunnyContainer:GameObject = new GameObject("bunnyContainer");
		scene.addNode(bunnyContainer);

		bunny = new Sprite("bunny.png");
		bunny.pivotX = 80;
		bunny.pivotY = 80;
		bunny.x = 250;
		bunny.y = 250;

		bunnyContainer.addNode(bunny);
	}

	override public function update(delta:Float)
	{
		super.update(delta);
		bunny.rotation += 0.05;
		bunny.scaleX = Math.sin(delta / 400) * 2;
		bunny.scaleY = Math.cos(delta / 100) * 2;
	}
}