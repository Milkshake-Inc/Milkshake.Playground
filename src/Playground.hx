package ;

@:expose
class Playground
{
	function new()
	{
		#if js
		boot();
		#end
	}
	
	public static function main()
	{
		#if cs
		boot();
		#end
	}
	
	public static function boot()
	{
		new PlaygroundGame().boot(Globals.SCREEN_HEIGHT, Globals.SCREEN_WIDTH);
	}
}