package;

abstract Float2(Float2Data) {
	public function new(x, y) {
		this = new Float2Data();
		this.x = x;
		this.y = y;
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

	@:op(a + b)
	public static inline function add(a:Float2, b:Float2):Float2 {
		return new Float2(a.x + b.x, a.y + b.y);
	}

	@:op(a - b)
	public static inline function sub(a:Float2, b:Float2):Float2 {
		return new Float2(a.x - b.x, a.y - b.y);
	}

	@:op(-b)
	public static inline function neg(a:Float2):Float2 {
		return new Float2(-a.x, -a.y);
	}

	@:op(a * b) @:commutative
	public static inline function mulScalar(a:Float2, b:Float):Float2 {
		return new Float2(a.x * b, a.y * b);
	}

	@:op(a * b)
	public static inline function mul(a:Float2, b:Float2):Float2 {
		return new Float2(a.x * b.x, a.y * b.y);
	}
}

private class Float2Data {
	public var x:Float;
	public var y:Float;

	public function new() {};
}
