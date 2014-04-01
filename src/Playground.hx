package ;

@:expose
class Playground
{
	function new()
	{
		#if js
		new PlaygroundGame().boot(500, 500);
		#end
	}
	
	public static function main()
	{
		#if cs
		new PlaygroundGame().boot(500, 500);
		#end
	}
}