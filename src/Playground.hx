package ;

import milkshake.Milkshake;

@:expose
class Playground
{
	function new()
	{
		#if js
		new Milkshake().boot(500, 500);
		#end
	}
	
	public static function main()
	{
		#if cs
		new Milkshake().boot(500, 500);
		#end
	}
}