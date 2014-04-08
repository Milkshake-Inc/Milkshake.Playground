package ;

import milkshake.game.MilkshakeGame;
import milkshake.game.scene.component.SceneComponent;
import milkshake.game.scene.Scene;
import milkshake.core.GameObject;
import milkshake.core.Node;
import milkshake.core.Sprite;

class ExampleSceneComponent extends SceneComponent
{
	public function new()
	{
		super("ExampleSceneComponent");
	}
	
	override private function nodeAdded(node:Node):Void 
	{
		if (Std.is(node, Sprite))
		{
			var sprite:Sprite = cast node;
			
			sprite.scaleX = 2;
			sprite.scaleY = 2;
		}
	}
}

class PlaygroundGame extends MilkshakeGame
{
	var bunny:Sprite;
	
	public function new() 
	{
		super();
		
		var scene:Scene = new Scene();
		scene.componentManager.addNode(new ExampleSceneComponent());
		
		
		var gameObject:GameObject = new GameObject();
		scene.addNode(gameObject);
		
		bunny = new Sprite("bunny.png");
		bunny.pivotX = 80;
		bunny.pivotY = 80;
		bunny.x = 250;
		bunny.y = 250;
		gameObject.addNode(bunny);
		
		
		
		sceneManager.addScene("defaultScene", scene);
	}
	
	
	override public function update(delta:Float):Void 
	{
		super.update(delta);
		
		//bunny.rotation += 0.05;
		//bunny.scaleX = Math.sin(delta / 400) * 2;
		//bunny.scaleY = Math.cos(delta / 100) * 2;
	}
}