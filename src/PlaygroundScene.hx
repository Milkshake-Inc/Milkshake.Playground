package ;

import milkshake.game.scene.Scene;
import milkshake.core.Sprite;
import milkshake.core.GameObject;
import milkshake.IGameCore;
import milkshake.input.KeyboardCode;
import milkshake.input.PixiInput;
import nape.constraint.Constraint;
import nape.constraint.PivotJoint;
import nape.dynamics.InteractionGroup;
import nape.geom.Vec2;
import nape.phys.Body;
import nape.phys.BodyType;
import nape.shape.Circle;
import nape.shape.Polygon;
import nape.shape.Shape;
import nape.space.Space;

class Tractor extends Sprite
{
	public var body(default, null):Body;
	public var backWheel(default, null):Body;
	public var frontWheel(default, null):Body;
	
	public function new(space:Space)
	{
		super("tractor.png");
		
		var ignoreGroup = new InteractionGroup(true);
		
		body = new Body(BodyType.DYNAMIC, new Vec2(1280 / 2, 720 / 2));
		body.shapes.add(new Polygon(Polygon.box(300, 200)));
		body.group = ignoreGroup;
		
		backWheel = new Body(BodyType.DYNAMIC);
		backWheel.shapes.add(new Circle(100));
		backWheel.group = ignoreGroup;
		
		frontWheel = new Body(BodyType.DYNAMIC);
		frontWheel.shapes.add(new Circle(80));
		frontWheel.group = ignoreGroup;
		
		body.space = space;
		backWheel.space = space;
		frontWheel.space = space;
		
		new PivotJoint(body, backWheel, new Vec2(-185, 75), new Vec2()).space = space;
		new PivotJoint(body, frontWheel, new Vec2(165, 75), new Vec2()).space = space;
		

	}
	
	override public function update(deltaTime:Float):Void 
	{
		x = body.position.x;
		y = body.position.y;
		rotation = body.rotation;
		
		
		super.update(deltaTime);
	}
}

class PlaygroundScene extends Scene
{
	private var bunny:Sprite;
	private var space:Space;
	private var debug:PixiDebug;
	private var box:Body;
	var tractor:Tractor;
	
	public function new(core:IGameCore, id:String="playgroundScene")
	{
		super(core, id);
		 
		space = new Space(new Vec2(0, 600));
		
		box = new Body(BodyType.STATIC);
		box.position.x = 1280 / 2;
		box.position.y = 720;
		box.shapes.add(new Polygon(Polygon.box(10000, 100)));
		box.space = space;
		
		addBunny();
		
		tractor = new Tractor(space);
		
		tractor.x = 1280 / 2;
		tractor.y = 720 / 2;
		addNode(tractor);
		
		
		debug = new PixiDebug();
		addNode(debug);
		
		
		
		core.input.addKeyDownHandler(KeyboardCode.RIGHT, function() { tractor.backWheel.angularVel += 1; } );
		core.input.addKeyDownHandler(KeyboardCode.LEFT, function() { tractor.backWheel.angularVel -= 1; } );
		
		core.input.addKeyDownHandler(KeyboardCode.A, function() { tractor.backWheel.velocity.y = -100; } );
		core.input.addKeyDownHandler(KeyboardCode.D, function() { tractor.frontWheel.velocity.y = -100; } );
		
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
	
		debug.drawSpace(space);
		super.update(delta);
		
		tractor.update(delta);
		//trace(bunny.y);
		//bunny.scaleX = Math.sin(delta / 400) * 2;
		//bunny.scaleY = Math.cos(delta / 100) * 2;
	}
}