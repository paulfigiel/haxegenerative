package;

import haxe.ds.Vector;
import Noise.Perlin;
import openfl.geom.Vector3D;

class Main extends GenerativeBase {
	var particles:Vector<Float3>;

	public function new() {
		super(1000, 1000);
		Display();
		// Save("test", true);
		particles = new Vector<Float3>(50);
		for (i in 0...particles.length) {
			particles[i] = new Float3(Std.random(1000), Std.random(1000), Std.random(1000));
		}
		DrawSquare(0,0,10000,10000,Color.fromARGBi(255,14,31,49));
		tickRate = 100;
	}

	override function Tick() {
		var start:Float3;
		for (x in 0...particles.length) {
			//SetPixel(Std.int(particles[x].x), Std.int(particles[x].y), Color.RED);
			// particles[x] += Perlin.Noise2D(particles[x].x,particles[x].y);
			start = particles[x];
			//DrawCircle(particles[x].x,particles[x].y,particles[x].z/1000,Std.int( particles[x].z*1000));
			particles[x] += Perlin.GetDFNoise(particles[x]/100);
			DrawLine(start,particles[x],Std.int( particles[x].z*100000),particles[x].z/500);
		}
	}

	override function ScreenFilter(x:Int, y:Int, previousColor:Int):Color {
		return Color.fromARGBf(1, Perlin.Noise2D(x / 200, y / 200) / 2, Perlin.Noise2D(x / 200 + 4152, y / 200) / 2,
			Perlin.Noise2D(x / 200, y / 200 + 14) / 2);
	}
}
