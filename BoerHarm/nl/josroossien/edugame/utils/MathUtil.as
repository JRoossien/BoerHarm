package nl.josroossien.edugame.utils {
public class MathUtil {
	private static const RADTODEG:Number = 180 / Math.PI;
	private static const DEGTORAD:Number = Math.PI / 180;
	
	public static function radToDeg( radians:Number ):Number {
		return radians * RADTODEG;
	}
	
	public static function degToRad( degrees:Number ):Number {
		return degrees * DEGTORAD;
	}
	
	public static function randomNumber( num1:Number, num2:Number ):Number {
		return num1 + Math.random() * ( num2 - num1 );
	}
	
	public static function confine(value:Number, min:Number, max:Number):Number {
		return value < min ? min : (value > max ? max : value);
	}
	
	public static function getDistance (p1:Object, p2:Object):Number {
		var a : Number = p1.x - p2.x;
		var b : Number = p1.y - p2.y;
		var c : Number = Math.sqrt ((a * a) + (b * b));
		return c;
	}
	
	public static function getAngle (p1:Object, p2:Object, returnRads:Boolean):Number {
		var theta:Number = Math.atan2(p1.x - p2.x , p1.y - p2.y);
		if(returnRads)
			return theta;
		theta = Math.PI / 180;
		return theta;
	}
	
	public static function getRadians(delta_x:Number, delta_y:Number):Number {
		var r:Number = Math.atan2(delta_y, delta_x);
		
		if (delta_y < 0)
		{
			r += (2 * Math.PI);
		}
		return r;
	}
	
	public static function getRAD(delta_x:Number, delta_y:Number):Number
	{
		var r:Number = Math.atan2(delta_y, delta_x);
		
		if (delta_y < 0)
		{
			r += (2 * Math.PI);
		}
		return r;
	}
	
	public static function getDEG(radians:Number):Number
	{
		return Math.floor(radians/(Math.PI/180));
	}
	
	public static function VelToDeg(vx,vy):Number {
		var dx = dx;
		var dy = dy;
		var ang = radToDeg(Math.atan(dy/dx));
		if (dx == 0) {
			if (dy > 0) {
				return 180;
			} else {
				return 360;
			}
		}
		if (dx > 0) {
			return 90 + ang;
		}
		if (dx < 0) {
			return 270 + ang;
		}
		return 0;
	}
	
}
}