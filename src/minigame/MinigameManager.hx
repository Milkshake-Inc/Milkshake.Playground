package minigame;

import milkshake.IGameCore;
import scenes.StartMenuScene;
import milkshake.game.scene.SceneManager;
import milkshake.game.scene.Scene;

class MinigameManager extends SceneManager
{	
	public function new(core:IGameCore)
	{
		super();

		var startMenu:Scene = new StartMenuScene(core);
		var playground:Scene = new PlaygroundScene(core);
		
		addScene("d", playground);
		//addScene(startMenu.id, startMenu);
	}
}
