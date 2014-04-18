package minigame;

import scenes.StartMenuScene;
import milkshake.game.scene.SceneManager;
import milkshake.game.scene.Scene;

class MinigameManager extends SceneManager
{
	public function new()
	{
		super();

		var startMenu:Scene = new StartMenuScene("startMenu");
		addScene(startMenu.id, startMenu);
	}
}
