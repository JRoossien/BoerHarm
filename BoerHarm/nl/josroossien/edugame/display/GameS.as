﻿package nl.josroossien.edugame.display  {		import flash.display.MovieClip;	import flash.events.Event;	import flash.geom.Rectangle;		import nl.josroossien.edugame.builders.LevelManager;	import nl.josroossien.edugame.core.EduGame;	import nl.josroossien.edugame.levels.Spring;	import nl.josroossien.edugame.objects.Block;	import nl.josroossien.edugame.objects.Player;	import nl.josroossien.edugame.objects.WalkingEnemy;	import nl.josroossien.edugame.utils.PointCollission;
		public class GameS extends MovieClip {		public static var gameS:GameS;	private var lm:MovieClip;	private var gui:GUI;	public var collectedItems:Number = 0;	public var kills:Number = 0;	public var levelS:Number = 0;	public var timeScore:Number = 500;	public var damageScore:Number = 0;	public var countDownScore:Boolean = true;		public function GameS(level:String) {		trace("GameS");		gameS = this;		EduGame.getMain().state == "game";				lm = new LevelManager(level);		addChild(lm);		gui = new GUI();		addChild(gui);		this.addEventListener(Event.ENTER_FRAME,gameLoop);	}		public static function getGameS():GameS {		return gameS;	}		private function gameLoop(event:Event):void {		if (countDownScore == true) {			timeScore -= .2;		}	}	}}