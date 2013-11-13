package nl.josroossien.edugame.events {

import flash.display.MovieClip;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;

import flashx.textLayout.elements.BreakElement;

import nl.josroossien.edugame.builders.LevelManager;
import nl.josroossien.edugame.core.EduGame;
import nl.josroossien.edugame.display.GameS;
import nl.josroossien.edugame.levels.Winter;
import nl.josroossien.edugame.objects.PitchFork;
import nl.josroossien.edugame.objects.Player;

public class EventsListener extends MovieClip {
	
	public static var eventL:EventsListener;
	public static var debug:Boolean = false;
	
	public function EventsListener() {
		eventL = this;
		trace("Event listener working!");
		
		EduGame.getMain().stage.addEventListener(KeyboardEvent.KEY_DOWN,keyDownHandler);
		EduGame.getMain().stage.addEventListener(KeyboardEvent.KEY_UP,keyUpHandler);
		EduGame.getMain().stage.addEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler);
		EduGame.getMain().stage.addEventListener(MouseEvent.MOUSE_UP,mouseUpHandler);
	}
	
	public static function getEventListener():EventsListener {
		if( eventL == null ) eventL = new EventsListener();
		return eventL;
	}
	
	public function keyDownHandler(e:KeyboardEvent):void {
		switch (e.keyCode) {
			case 65://Left key (A)
				if (EduGame.getMain().state == "game")
					Player.getPlayer().movingL = true;
				break;
			case 87://up key (W)
				if (EduGame.getMain().state == "game")
					Player.getPlayer().jumping = true;
				break;
			case 68://Right key (D)
				if (EduGame.getMain().state == "game")
					Player.getPlayer().movingR = true;
				break;
			case 32://(Spacebar)
				if (EduGame.getMain().state == "game")
					Player.getPlayer().charging = true;
				break;
			case 27:// Escape
			case 81:// Q
				if (EduGame.getMain().state == "game")
					EduGame.getMain().pause();
				break;
			case 48://down key (0)
				LevelManager.getLevelM().checkP();
				if (debug) {
					debug = false;
				} else {
					debug = true;
				}
				break;
		}
	}
	public function keyUpHandler(e:KeyboardEvent):void {
		switch (e.keyCode) {
			case 65://Left key (A)
				if (EduGame.getMain().state == "game")
					Player.getPlayer().movingL = false;
				break;
			case 87://up key (W)
				if (EduGame.getMain().state == "game")
					Player.getPlayer().jumping = false;
				break;
			case 68://Right key (D)
				if (EduGame.getMain().state == "game")
					Player.getPlayer().movingR = false;
				break;
			case 32://(Spacebar)
				if (EduGame.getMain().state == "game") {
					Player.getPlayer().charging = false;
					Player.getPlayer().shootPitchFork();
				}
				break;
		}
	}
	
	public function mouseDownHandler(e:MouseEvent):void {
	}
	
	public function mouseUpHandler(e:MouseEvent):void {	
	}
	
}
}