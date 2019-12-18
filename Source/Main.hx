package;

import Noise.Perlin;
import openfl.geom.Vector3D;

class Main extends GenerativeBase
{
	public function new()
	{
		super(1280,720);
		Generate();
		Display();
		//Save("test",true);
	}
	/*public override function GeneratePoint(x,y)
	{
		var dist = VectorMath.sdSphere(new Vector3D(x-xSize/2,y-ySize/2,0),200);
        var r = Std.int(dist * Std.random(90));
		bitmapData.setPixel(x,y,Color.fromARGBi(1,255-r,r,r));
	}*/
	override function GeneratePoint(x:Int, y:Int) {
		bitmapData.setPixel(x,y,Color.fromARGBf(1,Perlin.Noise2D(x/200,y/200)/2,Perlin.Noise2D(x/200+4152,y/200)/2,Perlin.Noise2D(x/200,y/200+14)/2));
	}
}
