package;

abstract Float3(Float3Data) {
	public function new(x, y, z) {
		this = new Float3Data();
		this.x = x;
		this.y = y;
		this.z = z;
	}

	public var x(get, set):Float;

	inline function get_x():Float {
		return this.x;
	}

	inline function set_x(x:Float):Float {
		this.x = x;
		return x;
	}

	public var y(get, set):Float;

	inline function get_y():Float {
		return this.y;
	}

	inline function set_y(y:Float):Float {
		this.y = y;
		return y;
	}

	public var z(get, set):Float;

	inline function get_z():Float {
		return this.z;
	}

	inline function set_z(z:Float):Float {
		this.z = z;
		return z;
	}

	@:op(a + b)
	public static inline function add(a:Float3, b:Float3):Float3 {
		return new Float3(a.x + b.x, a.y + b.y, a.z + b.z);
	}

	@:op(a - b)
	public static inline function sub(a:Float3, b:Float3):Float3 {
		return new Float3(a.x - b.x, a.y - b.y, a.z - b.z);
	}

	@:op(-b)
	public static inline function neg(a:Float3):Float3 {
		return new Float3(-a.x, -a.y, -a.z);
	}

	@:op(a * b) @:commutative
	public static inline function mulScalar(a:Float3, b:Float):Float3 {
		return new Float3(a.x * b, a.y * b, a.z * b);
	}

	@:op(a * b)
	public static inline function mul(a:Float3, b:Float3):Float3 {
		return new Float3(a.x * b.x, a.y * b.y, a.z * b.z);
	}

	@:op(a / b) @:commutative
	public static inline function divScalar(a:Float3, b:Float):Float3 {
		return new Float3(a.x / b, a.y / b, a.z / b);
	}

	@:op(a / b)
	public static inline function div(a:Float3, b:Float3):Float3 {
		return new Float3(a.x / b.x, a.y / b.y, a.z / b.z);
	}
}

private class Float3Data {
	public var x:Float;
	public var y:Float;
	public var z:Float;

	public function new() {}
}
