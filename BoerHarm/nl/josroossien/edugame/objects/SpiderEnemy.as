package nl.josroossien.edugame.objects  {

import flash.display.MovieClip;
import flash.events.Event;
import flash.geom.Rectangle;

import flashx.textLayout.elements.BreakElement;

import nl.josroossien.edugame.builders.LevelManager;
import nl.josroossien.edugame.display.GameS;
import nl.josroossien.edugame.utils.MathUtil;
import nl.josroossien.edugame.utils.RectangleCollision;
		public class SpiderEnemy extends MovieClip {				public static var sEnemy:SpiderEnemy;		
		private var web:Web;		private var spider:Spider;		private var vyE:Number;		private var eRect:Rectangle;		public var health:Number = 50;		private var block:Block;		private var count:Number = 0;
		private var maxFall:Number = 0;				public function SpiderEnemy(ID:Number) {			trace("SpiderEnemy created...");			sEnemy = this;			this.x = MathUtil.randomNumber(500,4800);			this.y = 0;			setupEnemy(ID);
			this.maxFall = MathUtil.randomNumber(250,600);			this.addEventListener(Event.ENTER_FRAME,gameLoop);		}				public static function getEnemyS():SpiderEnemy {			if( sEnemy == null ) sEnemy = new SpiderEnemy(1);			return sEnemy;		}				private function setupEnemy(ID:Number) {			switch (ID) {				case 1:					eRect = new Rectangle(0, 0, 125, 115); 					spider = new Spider();					addChild(spider);					break;				case 2:					break;			}		}				private function gameLoop(e:Event):void {					moveEnemy();			checkVoid();			checkDeath();		}				private function moveEnemy():void {			
			if (this.y > this.maxFall) {
				vyE = -6;
			}
			if (this.y < 50) {
				vyE = 10;
			}
						this.y += vyE;			eRect.y = this.y-this.height/2;
		}				private function checkVoid():void {			if (this.y-this.height > 768 || this.y < -100) {				this.x = MathUtil.randomNumber(500,4800);				this.y = MathUtil.randomNumber(100,600);			}		}				private function checkDeath():void {			if (this.health < 1) {				this.health = 50;				this.x = MathUtil.randomNumber(500,4800);				this.y = MathUtil.randomNumber(100,600);				GameS.getGameS().kills ++;			}		}		}}