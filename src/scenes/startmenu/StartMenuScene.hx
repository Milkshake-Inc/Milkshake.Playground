package scenes.startmenu;

import milkshake.game.scene.Scene;
import milkshake.game.scene.SceneManager;
import milkshake.game.ui.component.Button;
import milkshake.IGameCore;
import pixi.InteractionData;

class StartMenuScene extends Scene
{
	public function new(core:IGameCore, sceneManager:SceneManager)
	{
		super(core, "StartMenuScene");
		
		var singlePlayerButton:Button = new Button(250, 50, "Singleplayer", 0xA9F5A9, 0x58FA58);
		singlePlayerButton.x = 375;
		singlePlayerButton.y = 200;
		singlePlayerButton.displayObject.click = function(data:InteractionData):Void
		{
			var game:GameScene = cast sceneManager.scenes.get("game");
			game.isMultiplayer = false;
			sceneManager.changeScene("game");
		}
		addNode(singlePlayerButton);
		
		var multiPlayerButton:Button = new Button(250, 50, "Multiplayer", 0xA9F5A9, 0x58FA58);
		multiPlayerButton.x = 375;
		multiPlayerButton.y = 400;
		multiPlayerButton.displayObject.click = function(data:InteractionData):Void
		{
			var game:GameScene = cast sceneManager.scenes.get("game");
			game.isMultiplayer = false;
			sceneManager.changeScene("roomListScene");
		}
		addNode(multiPlayerButton);
	}


	override public function update(delta:Float)
	{
		super.update(delta);
	}
}
