package ;

import milkshake.Milkshake;
import milkshake.core.GameObject;
import milkshake.core.Sprite;
import pixi.Stage;

class PlaygroundGame extends Milkshake
{
	//var stage:GameObject;
	
	public function new() 
	{
		super();
		
		
	}
	
	override public function setStage(stage:Stage):Void 
	{
		super.setStage(stage);
		
		var bunny:Sprite = new Sprite("bunny.png");
		var bunnyContainer:GameObject = new GameObject();
		
		bunnyContainer.addNode(bunny);
		
		stage.addChild(bunny.sprite);
	}
	
	override public function update(delta:Float):Void 
	{
		super.update(delta);
	}
}