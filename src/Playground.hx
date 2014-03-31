package Milkshake;

@:expose
class Playground
{
	function new()
	{
		#if js
		new Milkshake().boot(289, 510);
		#end
	}
	
	public static function main()
	{
		#if cs
		new Milkshake().boot(289, 510);
		#end
	}
}