package ;

import milkshake.game.MilkshakeGame;
import milkshake.game.scene.Scene;
import milkshake.core.GameObject;
import milkshake.core.Sprite;

class PlaygroundGame extends MilkshakeGame
{
	var bunny:Sprite;
	
	public function new() 
	{
		super();
		
		var scene:Scene = new Scene();
		
		var gameObject:GameObject = new GameObject();
		bunny = new Sprite("bunny.png");
		bunny.scaleX = bunny.scaleY = 2;
		bunny.pivotX = 80;
		bunny.pivotY = 80;
		bunny.x = 250;
		bunny.y = 250;
		gameObject.addNode(bunny);
		
		scene.addNode(gameObject);
		
		sceneManager.addScene("defaultScene", scene);
	}
	
	
	override public function update(delta:Float):Void 
	{
		super.update(delta);
		
		//bunny.rotation += 0.05;
		bunny.scaleX = Math.sin(delta / 400) * 2;
		//bunny.scaleY = Math.cos(delta / 100) * 2;
	}
}