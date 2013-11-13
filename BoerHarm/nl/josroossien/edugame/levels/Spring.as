﻿package nl.josroossien.edugame.levels  {import flash.display.DisplayObject;import flash.display.MovieClip;import flash.events.Event;import flash.geom.Rectangle;import flash.media.SoundChannel;import nl.josroossien.edugame.builders.LevelManager;import nl.josroossien.edugame.builders.SoundManager;import nl.josroossien.edugame.objects.Block;import nl.josroossien.edugame.utils.DisplayUtil;
public class Spring extends MovieClip {		public static var spring:Spring;	private var springBG:SpringBG;	private var block:Block;	private var rect:Rectangle;	private var green:uint = 0x00AA00;	private var brown:uint = 0x673700;	private var red:uint = 0xD00000;	private var yellow:uint = 0xffee00;	private var black:uint = 0x000000;	private var white:uint = 0xffffff;	public var finish:Block;	private var pot:Potato;		public function Spring() {		trace("Spring working.");		spring = this;		springBG = new SpringBG();		addChild(springBG);		drawLevel();		createCollectables();		this.addEventListener(Event.ENTER_FRAME,gameLoop);	}		public static function getSpring():Spring {		return spring;	}		private function gameLoop(e:Event):void {			}		private function drawLevel():void {				//var displayTestBlock = new Block(4400,710,600,200,white);		//addChild(displayTestBlock);				var floor1 = new Rectangle(0,620,955,200);		LevelManager.getLevelM().LvlObjects.push(floor1);		var floor2 = new Rectangle(1275,620,1020,200);		LevelManager.getLevelM().LvlObjects.push(floor2);		var floor3 = new Rectangle(2480,620,320,200);		LevelManager.getLevelM().LvlObjects.push(floor3);		var floor4 = new Rectangle(2985,620,860,200);		LevelManager.getLevelM().LvlObjects.push(floor4);		var floor5 = new Rectangle(4050,620,950,200);		LevelManager.getLevelM().LvlObjects.push(floor5);		var pl1 = new Rectangle(940,355,360,50);		LevelManager.getLevelM().LvlObjects.push(pl1);		var pl2 = new Rectangle(2250,365,210,50);		LevelManager.getLevelM().LvlObjects.push(pl2);		var pl3 = new Rectangle(2770,375,255,50);		LevelManager.getLevelM().LvlObjects.push(pl3);		var pl4 = new Rectangle(3795,390,315,50);		LevelManager.getLevelM().LvlObjects.push(pl4);						var item1 = new ItemHaas();		addChild(item1);		item1.width = 50;		item1.height = 50;		item1.x = 1135;		item1.y = 305;		LevelManager.getLevelM().LvlItems.push(item1);		item1.name = "Hoas";				var item2 = new ItemKijk();		addChild(item2);		item2.width = 50;		item2.height = 50;		item2.x = 2600;		item2.y = 120;		LevelManager.getLevelM().LvlItems.push(item2);		item2.name = "Kiek";				var item3 = new ItemEi();		addChild(item3);		item3.width = 50;		item3.height = 50;		item3.x = 3950;		item3.y = 340;		LevelManager.getLevelM().LvlItems.push(item3);		item3.name = "Aaier";				finish = new Block(4950,450,50,100,black);		addChild(finish);		finish.name = "finish";	}		public function createCollectables() {		for (var i:int = 0; i < LevelManager.getLevelM().LvlPotato.length ; i++) {			removeChild(LevelManager.getLevelM().LvlPotato[i]);		}		LevelManager.getLevelM().LvlPotato.splice(0,LevelManager.getLevelM().LvlPotato.length);		createPotato(500,600);		createPotato(900,600);		createPotato(1450,600);		createPotato(2100,600);		createPotato(2630,600);		createPotato(3450,600);		createPotato(3760,600);		createPotato(4200,600);		createPotato(4630,600);	}		private function createPotato(xPos:Number, yPos:Number) {		pot = new Potato();		addChild(pot);		pot.x = xPos;		pot.y = yPos;		pot.width = 50;		pot.height = 50;		pot.name = "potato";		LevelManager.getLevelM().LvlPotato.push(pot);	}	}	}