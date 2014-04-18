package ;
import milkshake.core.GameObject;
import nape.shape.Circle;
import nape.shape.Polygon;
import nape.space.Space;
import nape.util.Debug;
import pixi.Graphics;

class PixiDebug extends GameObject
{
	public var pixiDebug:PixiDebugRenderer;
	
	public function new()
	{
		super();
		
		pixiDebug = new PixiDebugRenderer();
		displayObject.addChild(pixiDebug.graphics);
	}
	
	public function drawSpace(space:Space)
	{
		pixiDebug.draw(space);
	}
}

class PixiDebugRenderer extends Debug
{
	public var graphics:Graphics;

	public function new()
	{
		graphics = new Graphics();
	}
	
	public function draw(space:Space)
	{
		graphics.clear();
		
	
		for (body in space.bodies)
		{
			for (shape in body.shapes)
			{
				if (Std.is(shape, Polygon))
				{
					graphics.beginFill(0xFF0000, 0.5);					
					graphics.lineStyle(1, 0xFF0000);
					
					var polygon:Polygon = cast shape;
					
					for (index in 0 ... polygon.worldVerts.length)
					{
						var position = polygon.worldVerts.at(index);
						
						if (index == 0) graphics.moveTo(position.x, position.y);
						else graphics.lineTo(position.x, position.y);						
					}
				}
				
				if (Std.is(shape, Circle))
				{
					var circle:Circle = cast shape;
					graphics.beginFill(0x00FF00, 0.5);
					graphics.lineStyle(1, 0x00FF00);
					
					graphics.drawCircle(circle.worldCOM.x, circle.worldCOM.y, circle.radius);
					
					graphics.moveTo(circle.worldCOM.x, circle.worldCOM.y);
					graphics.lineTo(body.position.x + circle.radius * Math.cos(body.rotation), body.position.y +circle.radius * Math.sin(body.rotation));
				}
			}
		}
	}
	
}