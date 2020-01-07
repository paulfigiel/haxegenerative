package;

import openfl.ui.Keyboard;
import openfl.display.Shape;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import lime.ui.FileDialog;
import openfl.geom.Vector3D;
import openfl.utils.ByteArray;
#if js
import js.Browser;
#else
import sys.FileSystem;
import sys.io.File;
#end
import openfl.display.PNGEncoderOptions;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.display.Bitmap;
import Color;

class GenerativeBase extends Sprite {
	var imageData:ByteArray;
	private var bitmapData:BitmapData;
	var xSize:Int;
	var ySize:Int;
	var ticking:Bool;
	public var tickRate:Int = 1;

	public function new(xSize, ySize) {
		super();
		this.xSize = xSize;
		this.ySize = ySize;
		bitmapData = new BitmapData(xSize, ySize);
		bitmapData.lock();
		stage.addEventListener(KeyboardEvent.KEY_DOWN, KeyDown);
		stage.addEventListener(KeyboardEvent.KEY_UP, KeyUp);
		addEventListener(Event.ENTER_FRAME, OnEnterFrame);
	}

	public function Display() {
		var bitmap = new Bitmap(bitmapData);
		addChild(bitmap);
	}

	private function Generate() {
		for (x in 0...xSize) {
			for (y in 0...ySize) {
				bitmapData.setPixel(x, y, ScreenFilter(x, y, bitmapData.getPixel(x, y)));
			}
		}
	}

	public function DrawCircle(x, y, radius, c:Color) {
		var s:Shape = new Shape();
		s.graphics.beginFill(c);
		s.graphics.drawCircle(x, y, radius);
		s.graphics.endFill();
		bitmapData.draw(s);
	}

	public function DrawSquare(x, y, xSize, ySize, c:Color) {
		var s:Shape = new Shape();
		s.graphics.beginFill(c);
		s.graphics.drawRect(x, y, xSize, ySize);
		s.graphics.endFill();
		bitmapData.draw(s);
	}

	public function DrawLine(begin:Float3, end:Float3, c:Color, thickness:Float) {
		var s:Shape = new Shape();
		s.graphics.beginFill(c);
		s.graphics.lineStyle(thickness, c);
		s.graphics.moveTo(begin.x, begin.y);
		s.graphics.lineTo(end.x, end.y);
		s.graphics.endFill();
		bitmapData.draw(s);
	}

	public function ScreenFilter(x, y, previousColor):Color {
		return 0;
	}

	public function Tick() {}

	public function Lock() {
		bitmapData.lock();
	}

	public function Unlock() {
		bitmapData.unlock();
	}

	public function SetPixel(x, y, c:Color) {
		bitmapData.setPixel(x, y, c);
	}

	public function Save(name:String, appendDate:Bool = false) {
		bitmapData.unlock();
		var imageData = bitmapData.encode(bitmapData.rect, new PNGEncoderOptions(false));
		var fullName = name + Date.now().getTime() + ".png";
		#if js
		var dialog:FileDialog = new FileDialog();
		dialog.save(imageData, "png", fullName, "file");
		trace(fullName);
		#else
		var path = FileSystem.fullPath(fullName);
		File.saveBytes(path, imageData);
		trace(path);
		#end
		bitmapData.lock();
	}

	private function KeyDown(event:KeyboardEvent) {
		switch event.keyCode {
			case Keyboard.SPACE:
				ticking = true;
			case Keyboard.S:
				Save("", true);
		}
	}

	private function KeyUp(event:KeyboardEvent) {
		if (event.keyCode == Keyboard.SPACE) {
			ticking = false;
		}
		switch event.keyCode {
			case Keyboard.SPACE:
				ticking = false;
		}
	}

	private function OnEnterFrame(event:Event) {
		if (ticking) {
			Lock();
			for (i in 0...tickRate)
			Tick();
			Unlock();
		}
	}
}
