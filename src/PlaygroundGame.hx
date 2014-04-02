package ;

import milkshake.Milkshake;
import milkshake.core.GameObject;
import milkshake.core.Sprite;
import pixi.Stage;

class PlaygroundGame extends Milkshake
{
	var bunny:Sprite;
	
	public function new() 
	{
		super();		
	}
	
	override public function setStage(stage:Stage):Void 
	{
		super.setStage(stage);
		
		var gameObject:GameObject = new GameObject();
		bunny = new Sprite("bunny.png");
		bunny.scaleX = bunny.scaleY = 2;
		bunny.pivotX = 80;
		bunny.pivotY = 80;
		bunny.x = 250;
		bunny.y = 250;
		gameObject.addNode(bunny);
		
		stage.addChild(gameObject.displayObject);
	}
	
	override public function update(delta:Float):Void 
	{
		super.update(delta);
		
		//bunny.rotation += 0.05;
		bunny.scaleX = Math.sin(delta / 400) * 2;
		//bunny.scaleY = Math.cos(delta / 100) * 2;
	}
}