﻿package nl.josroossien.edugame.objects  {import flash.display.MovieClip;
import flash.events.Event;
import flash.geom.Rectangle;

import nl.josroossien.edugame.builders.LevelManager;
import nl.josroossien.edugame.display.GameS;
import nl.josroossien.edugame.utils.MathUtil;
import nl.josroossien.edugame.utils.RectangleCollision;
		public class Projectile extends MovieClip {				public static var proj:Projectile;				private var projType:Number = 0;		private var vx:Number = -1;		private var vy:Number = -5			;		private var disX:Number = 0;		private var disY:Number = 0;		private var endX:Number = 0;		private var endY:Number = 0;		private var rad:Number = 0;		private var deg:Number = 0;		private var speed:Number = 25;		private var gravity:Number = .1;		private var eRect:Rectangle;		public var health:Number = 250;		private var block:Block;		private var projRect:Rectangle;		private var snowb:Snowball;		private var leaf:Leaf;		private var laser:Laser;		private var ei:Ei;				public function Projectile(ID:Number,type:Number,targetX:Number,targetY:Number,startX:Number,startY:Number) {			proj = this;			this.x = 0;			this.y = 0;			this.width = 1024;			this.height = 768;			projType = type;			setupProjectile(type,startX,startY);			calculateVelocity(targetX,targetY,startX,startY);			this.addEventListener(Event.ENTER_FRAME,gameLoop);		}				public static function getProj():Projectile {			return proj;		}				private function calculateVelocity(targetX:Number,targetY:Number,startX:Number,startY:Number):void {						disY = (Player.getPlayer().y+(Player.getPlayer().y/2)) - startY-startY/2;			disX = (Player.getPlayer().x+(Player.getPlayer().x/2)) - startX-startX/2;			rad = Math.atan2(disY,disX);			deg = Math.round((rad*180/Math.PI));			this.vx =  Math.cos(rad) * speed;			this.vy =  Math.sin(rad) * speed;		}				private function setupProjectile(type:Number,startX:Number,startY:Number) {			var block:Block;			switch (type) {				case 1:					projRect = new Rectangle(0, 0, 250, 250); 					snowb = new Snowball();					LevelManager.getLevelM().addChild(snowb);					LevelManager.getLevelM().projs.push(snowb);					snowb.x = startX;					snowb.y = startY;					break;				case 2:					projRect = new Rectangle(0, 0, 250, 250); 					leaf = new Leaf();					LevelManager.getLevelM().addChild(leaf);					LevelManager.getLevelM().projs.push(leaf);					leaf.x = startX;					leaf.y = startY;					break;					break;				case 3:					projRect = new Rectangle(0, 0, 250, 250); 					laser = new Laser();					LevelManager.getLevelM().addChild(laser);					LevelManager.getLevelM().projs.push(laser);					laser.x = startX;					laser.y = startY;					laser.width * .5;					laser.height * .5;					speed = 30;					break;				case 4:					projRect = new Rectangle(0, 0, 250, 250); 					ei = new Ei();					LevelManager.getLevelM().addChild(ei);					LevelManager.getLevelM().projs.push(ei);					ei.x = startX;					ei.y = startY;					break;			}		}				private function gameLoop(e:Event):void {					moveProjectile();			checkVoid();		}				private function moveProjectile():void {						if (projType == 1) {				vy += gravity;				snowb.x += vx;				snowb.y += vy;			}			if (projType == 2) {				vy += gravity*2;				leaf.x += vx;				leaf.y += vy;				leaf.rotation += 33;			}			if (projType == 3) {				laser.x += vx;				laser.y += vy;				laser.rotation = deg+90;				}			if (projType == 4) {				vy += gravity;				ei.x += vx;				ei.y += vy;			}						projRect.x = this.x-this.width/2;			projRect.y = this.y-this.height/2;		}				private function checkVoid():void {			for (var i = 0; i < LevelManager.getLevelM().projs.length; i++ ) {				if (LevelManager.getLevelM().projs[i].y-LevelManager.getLevelM().projs[i].height > 768 || LevelManager.getLevelM().projs[i].x < 0) {					parent.removeChild(LevelManager.getLevelM().projs[i]);					LevelManager.getLevelM().projs.splice(i, 1);				}			}		}		}}