package nl.josroossien.edugame.levels {
import flash.display.MovieClip;
import flash.geom.Rectangle;

import nl.josroossien.edugame.builders.LevelManager;
import nl.josroossien.edugame.objects.ShootingBoss;

public class AutumnBoss extends MovieClip {
	
	public static var autumnBoss:AutumnBoss;
	
	public function AutumnBoss() {
		autumnBoss = this;
		var autumnBG = new AutumnBG();
		addChild(autumnBG);
		var autumnB = new ShootingBoss(2);
		LevelManager.getLevelM().enemies.push(autumnB);
		addChild(autumnB);
		drawLevel();
	}
	
	public static function getAutumnBoss():AutumnBoss {
		return autumnBoss;
	}
	
	private function drawLevel():void {
		var floor1 = new Rectangle(0,710,2000,200);
		LevelManager.getLevelM().LvlObjects.push(floor1);
	}
}
}