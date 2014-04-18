package ;

import milkshake.game.MilkshakeGame;

class PlaygroundGame extends MilkshakeGame
{
	public function new()
	{
		super();
		
		var scene:PlaygroundScene = new PlaygroundScene();
		scene.componentManager.addNode(new SceneScalingComponent());
		
		sceneManager.addScene("defaultScene", scene);
	}
	
	
	override public function update(delta:Float):Void 
	{
		super.update(delta);
	}
}