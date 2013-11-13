package nl.josroossien.edugame.levels {
import flash.display.MovieClip;
import flash.geom.Rectangle;

import nl.josroossien.edugame.builders.LevelManager;
import nl.josroossien.edugame.objects.ShootingBoss;

public class WinterBoss extends MovieClip {
	
	public static var winterBoss:WinterBoss;
	
	public function WinterBoss() {
		winterBoss = this;
		var winterBG = new WinterBG();
		addChild(winterBG);
		var winterB = new ShootingBoss(1);
		LevelManager.getLevelM().enemies.push(winterB);
		addChild(winterB);
		drawLevel();
	}
	
	public static function getWinterBoss():WinterBoss {
		if( winterBoss == null ) winterBoss = new WinterBoss();
		return winterBoss;
	}
	
	private function drawLevel():void {
		var floor1 = new Rectangle(0,650,2000,200);
		LevelManager.getLevelM().LvlObjects.push(floor1);
	}
}
}