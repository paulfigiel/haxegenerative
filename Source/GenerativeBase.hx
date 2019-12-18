package;

import openfl.geom.Vector3D;
import openfl.utils.ByteArray;
import sys.FileSystem;
import sys.io.File;
import openfl.display.PNGEncoderOptions;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.display.Bitmap;
import Color;

class GenerativeBase extends Sprite
{
    var imageData:ByteArray;
    var bitmapData:BitmapData;
    var xSize:Int;
    var ySize:Int;

	public function new(xSize,ySize)
	{
		super();
        this.xSize = xSize;
        this.ySize = ySize;
		bitmapData = new BitmapData(xSize,ySize);
	}
    public function Display()
    {
		var bitmap = new Bitmap(bitmapData);
		addChild(bitmap);
    }
    private function Generate()
    {
		for (x in 0...xSize)
		{
			for(y in 0...ySize){
                GeneratePoint(x,y);
			}
        }
    }
    public function GeneratePoint(x,y)
    {

    }
    public function Save(name:String,appendDate:Bool=false)
    {
		var imageData = bitmapData.encode(bitmapData.rect,new PNGEncoderOptions(false));
        var path = FileSystem.fullPath(name+Date.now().getTime()+".png");
		File.saveBytes(path,imageData);
		trace(path);
    }
}
