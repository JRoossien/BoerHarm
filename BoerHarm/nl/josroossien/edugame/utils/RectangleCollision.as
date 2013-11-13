package nl.josroossien.edugame.utils {
import flash.geom.Rectangle;

public class RectangleCollision {
	
	public function RectangleCollision() {
	}
	
	
	public static function rectLeft(strongRect:Rectangle, weakRect:Rectangle, tolerance:uint = 2, overlap:Number = 0):Number{
		var overlapRect1:Rectangle = strongRect.intersection(weakRect);
		
		if(overlapRect1.width <= tolerance && overlapRect1.height <= tolerance)
			return 0;
		
		if(overlapRect1.height > overlapRect1.width) {
			if(weakRect.x > strongRect.x) {
				return overlapRect1.width - overlap;
			}
		}
		return 0;
	}
	
	public static function rectRight(strongRect:Rectangle, weakRect:Rectangle, tolerance:uint = 2, overlap:Number = 0):Number{
		var overlapRect2:Rectangle = strongRect.intersection(weakRect);
		
		if(overlapRect2.width <= tolerance && overlapRect2.height <= tolerance)
			return 0;
		
		if(overlapRect2.height > overlapRect2.width) {
			if(weakRect.x < strongRect.x) {
				return overlapRect2.width - overlap;
			}
		}
		return 0;
	}
	
	public static function rectTop(strongRect:Rectangle, weakRect:Rectangle, tolerance:uint = 2, overlap:Number = 0):Number{
		var overlapRect3:Rectangle = strongRect.intersection(weakRect);
		
		if(overlapRect3.width <= tolerance && overlapRect3.height <= tolerance)
			return 0;
		
		if(overlapRect3.width > overlapRect3.height) {
			if(weakRect.y > strongRect.y) {
				return overlapRect3.height - overlap;
			}
		}
		return 0;
	}
	
	public static function rectBot(strongRect:Rectangle, weakRect:Rectangle, tolerance:uint = 2, overlap:Number = 0):Number{
		var overlapRect4:Rectangle = strongRect.intersection(weakRect);
		
		if(overlapRect4.width <= tolerance && overlapRect4.height <= tolerance)
			return 0;
		
		if(overlapRect4.width > overlapRect4.height) {
			if(weakRect.y < strongRect.y) {
				return overlapRect4.height - overlap;
			}
		}
		return 0;
	}
	
	
	public static function rectCheckDir(strongRect:Rectangle, weakRect:Rectangle, tolerance:uint = 2, overlap:Number = 0):uint{
		var overlapRect:Rectangle = strongRect.intersection(weakRect);
		
		if(overlapRect.width <= tolerance && overlapRect.height <= tolerance) {
			return 0;
		}
		
		if(overlapRect.width > overlapRect.height) {
			if(weakRect.y < strongRect.y) {
				return 2;
			} else {
				return 8;
			}
		} else {
			if(weakRect.x < strongRect.x) {
				return 6;
			}
			else {
				return 4;
			}
		}
	}
}
}