package nl.josroossien.edugame.utils {
import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;

public class DisplayUtil {
	
	public static function bringToFront(object:DisplayObject, back:uint = 0):int {
		if (!object.parent)
			return -1;
		
		var index:int = object.parent.numChildren - (back + 1);
		index = MathUtil.confine(index, 0, object.parent.numChildren - 1);
		object.parent.setChildIndex(object, index);
		
		return index;
	}
	
	public static function bringForward(object:DisplayObject, steps:uint = 1):int {
		if (!object.parent)
			return -1;
		
		var index:int = object.parent.getChildIndex(object) + steps;
		index = MathUtil.confine(index, 0, object.parent.numChildren - 1);
		object.parent.setChildIndex(object, index);
		
		return index;
	}
	
	public static function sendToBack(object:DisplayObject, forward:uint = 0):int {
		if (!object.parent)
			return -1;
		
		var index:int = MathUtil.confine(forward, 0, object.parent.numChildren - 1);
		object.parent.setChildIndex(object, index);
		
		return index;
	}
	
	public static function sendBackward(object:DisplayObject, steps:uint = 1):int {
		if (!object.parent)
			return -1;
		
		var index:int = object.parent.getChildIndex(object) - steps;
		index = MathUtil.confine(index, 0, object.parent.numChildren - 1);
		object.parent.setChildIndex(object, index);
		
		return index;
	}
	
	public static function removeAllChildrenByType(container:DisplayObjectContainer, type:Class):void {
		for each(var child:DisplayObject in container) {
			if(child is type) {
				container.removeChild(child);
			}
		}
	}
	
	public static function removeAllChildren(container:DisplayObjectContainer, leave:int = 0):void {
		while (container.numChildren > leave) {
			container.removeChildAt(leave);
		}
	}
	
	public static function isVisible(obj:DisplayObject):Boolean {
		for (var cur:DisplayObject = obj; cur != null; cur = cur.parent) {
			if (!cur.visible) {
				return false;
			}
		}
		return true;
	}
	
	
}
}