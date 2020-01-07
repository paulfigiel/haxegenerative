package;

import openfl.geom.Vector3D;

class GMath {
	public static function crossProduct(a:Float3, b:Float3):Float3 {
		return new Float3(a.y * b.z - a.z * b.y, a.z * b.x - a.x * b.z, a.x * b.y - a.y * b.x);
	}

	public static function length(f1:Vector3D, f2:Vector3D):Float {
		return Math.sqrt(Math.pow(f2.x - f1.x, 2) + Math.pow(f2.y - f1.y, 2) + Math.pow(f2.z - f1.z, 2));
	}

	public static function sdSphere(p:Vector3D, s:Float):Float {
		return p.length - s;
	}

	public static function RandomDirectionInHemisphere(v:Vector3D):Vector3D {
		var result:Vector3D = RandomPointInSphere();
		if (result.dotProduct(v) < 0) {
			result.x = -result.x;
			result.y = -result.y;
			result.z = -result.z;
		}
		return result;
	}

	public static function RandomPointInSphere() {
		var v = new Vector3D(Std.random(999999), Std.random(999999), Std.random(999999));
		v.normalize();
		return v;
	}
}
