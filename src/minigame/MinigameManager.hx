package minigame;

import milkshake.IGameCore;
import scenes.StartMenuScene;
import milkshake.game.scene.SceneManager;
import milkshake.game.scene.Scene;

class MinigameManager extends SceneManager
{	
	public function new()
	{
		super();

		var startMenu:Scene = new StartMenuScene();
		
		addScene(startMenu.id, startMenu);
	}
}
