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
		new PlaygroundGame().boot(1280, 720);
	}
}