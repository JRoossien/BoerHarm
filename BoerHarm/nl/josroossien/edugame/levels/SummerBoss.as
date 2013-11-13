package nl.josroossien.edugame.levels {
import flash.display.MovieClip;
import flash.geom.Rectangle;

import nl.josroossien.edugame.builders.LevelManager;
import nl.josroossien.edugame.objects.ShootingBoss;

public class SummerBoss extends MovieClip {
	
	public static var summerBoss:SummerBoss;
	
	public function SummerBoss() {
		summerBoss = this;
		var summerBG = new SummerBG();
		addChild(summerBG);
		var summerB = new ShootingBoss(3);
		LevelManager.getLevelM().enemies.push(summerB);
		addChild(summerB);
		drawLevel();
	}
	
	public static function getSummerBoss():SummerBoss {
		return summerBoss;
	}
	
	private function drawLevel():void {
		var floor1 = new Rectangle(0,710,2000,200);
		LevelManager.getLevelM().LvlObjects.push(floor1);
	}
}
}