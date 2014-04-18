package ;

import milkshake.game.scene.Scene;
import milkshake.core.Sprite;
import milkshake.core.GameObject;
import nape.geom.Vec2;
import nape.phys.Body;
import nape.phys.BodyType;
import nape.shape.Polygon;
import nape.space.Space;

class PlaygroundScene extends Scene
{
	private var bunny:Sprite;
	private var space:Space;
	private var debug:PixiDebug;
	private var box:Body;
	
	public function new(id:String="playgroundScene")
	{
		super(id);
		
		space = new Space(new Vec2(0, 600));
		
		box = new Body(BodyType.DYNAMIC);
		box.shapes.add(new Polygon(Polygon.box(100, 100)));
		box.space = space;
		
		addBunny();
	}

	private function addBunny():Void
	{
		var bunnyContainer:GameObject = new GameObject("bunnyContainer");
		scene.addNode(bunnyContainer);

		bunny = new Sprite("bunny.png");
		
		bunnyContainer.addNode(bunny);
	}

	override public function update(delta:Float)
	{
		space.step(1 / 24);
	
		
		super.update(delta);
		
		bunny.y = box.position.y;
		//trace(bunny.y);
		//bunny.scaleX = Math.sin(delta / 400) * 2;
		//bunny.scaleY = Math.cos(delta / 100) * 2;
	}
}