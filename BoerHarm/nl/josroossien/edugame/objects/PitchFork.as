package nl.josroossien.edugame.objects {
import flash.display.MovieClip;
import flash.events.Event;

import nl.josroossien.edugame.builders.LevelManager;
import nl.josroossien.edugame.utils.MathUtil;

public class PitchFork extends MovieClip {
	
	public static var pitchFork:PitchFork;
	private var vx:Number;
	private var vy:Number;
	private var rot:Number = 0;
	private var gravity:Number = .7;
	private var pitchForks:Array = [];
	private var PF:PitchForkImg;
	private var dx:Number = 0;
	private var dy:Number = 0;
	private var didHit:Boolean;
	
	public function PitchFork(givenSpeed:Number) {
		createPitchFork(givenSpeed);
		pitchFork = this;
		this.addEventListener(Event.ENTER_FRAME,gameLoop);
	}
	
	public static function getPitchFork():PitchFork {
		if( pitchFork == null ) pitchFork = new PitchFork(1);
		return pitchFork;
	}
	
	private function gameLoop(e:Event):void {
		updatePitchFork();
		checkEnemyCollision();
	}
	
	private function createPitchFork(shotPower:Number):void {
		PF = new PitchForkImg();
		
		if (Player.getPlayer().left) {
			this.vx = -shotPower;
			PF.rotation = 270;
		} else {
			this.vx = +shotPower;
			PF.rotation = 90;
		}
		this.vy = -shotPower/2;
		
		this.x = Player.getPlayer().x - Player.getPlayer().x/2;
		this.y = Player.getPlayer().y - Player.getPlayer().y/2;
		
		addChild(PF);
		PF.x = this.x;
		PF.y = this.y;
		
		pitchForks.push(this);
	}
	
	private function updatePitchFork():void {
		
		for (var i = 0; i < pitchForks.length; i++ ) {
			pitchForks[i].vy += gravity;
			var radians:Number = Math.atan2(pitchForks[i].vy, pitchForks[i].vx);
			pitchForks[i].PF.rotation = (radians * 180 / Math.PI) + 90;
			pitchForks[i].x += pitchForks[i].vx;
			pitchForks[i].y += pitchForks[i].vy;
			if (pitchForks[i].y >= 768) {
				LevelManager.getLevelM().getLevel().removeChild(pitchForks[i]);
				pitchForks.splice(i, 1);
			}
		}
	}
	
	private function checkEnemyCollision():void {
		for(var i:Number = 0; i < LevelManager.getLevelM().enemies.length; i++) {
			if (this.hitTestObject(LevelManager.getLevelM().enemies[i])) {
				if (this.didHit == false) {
					LevelManager.getLevelM().enemies[i].health -= 25;
					this.didHit = true;
					this.vx *= .2;
				}
			}
		}
	}
}
}