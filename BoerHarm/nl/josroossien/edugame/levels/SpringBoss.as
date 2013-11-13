package nl.josroossien.edugame.levels {
import flash.display.MovieClip;
import flash.geom.Rectangle;

import nl.josroossien.edugame.builders.LevelManager;
import nl.josroossien.edugame.objects.ShootingBoss;

public class SpringBoss extends MovieClip {
	
	public static var springBoss:SpringBoss;
	
	public function SpringBoss() {
		springBoss = this;
		var springBG:SpringBG = new SpringBG();
		addChild(springBG);
		var springB = new ShootingBoss(4);
		LevelManager.getLevelM().enemies.push(springB);
		addChild(springB);
		drawLevel();
	}
	
	public static function getSpringBoss():SpringBoss {
		return springBoss;
	}
	
	private function drawLevel():void {
		var floor1 = new Rectangle(0,710,2000,200);
		LevelManager.getLevelM().LvlObjects.push(floor1);
	}
}
}