package nl.josroossien.edugame.utils {

public class PointCollission {
	
	public static function checkTop( obj1:Object, obj2:Object, yRad:Number ):Boolean {
		if(obj1.hitTestPoint(obj2.x, obj2.y - yRad, true))
			return true;
		return false;
	}
	
	public static function checkBottom( obj1:Object, obj2:Object, yRad:Number ):Boolean {
		if(obj1.hitTestPoint(obj2.x, obj2.y + yRad, true))
			return true;
		return false;
	}
	
	public static function checkLeft( obj1:Object, obj2:Object, xRad:Number ):Boolean {
		if(obj1.hitTestPoint(obj2.x - xRad, obj2.y, true))
			return true;
		return false;
	}
	
	public static function checkRight( obj1:Object, obj2:Object, xRad:Number ):Boolean {
		if(obj1.hitTestPoint(obj2.x + xRad, obj2.y, true))
			return true;
		return false;
	}
}
}