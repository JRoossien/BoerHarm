package nl.josroossien.edugame.utils {
import flash.system.System;
import flash.text.TextField;
import flash.utils.getTimer;

import nl.josroossien.edugame.builders.LevelManager;
import nl.josroossien.edugame.core.EduGame;
import nl.josroossien.edugame.events.EventsListener;
import nl.josroossien.edugame.levels.Spring;
import nl.josroossien.edugame.objects.Player;

public class Debug {
	
	public static var debug:Debug;
	private var frames:int=0;
	private var prevTimer:Number=0;
	private var curTimer:Number=0;
	public var fps:Number = 0;
	public var debugBox:TextField; 
	
	public function Debug() {
		debug = this;
		debugBox = new TextField;
		EduGame.getMain().stage.addChild(debugBox); 
		debugBox.multiline = true;
		debugBox.y = 50;
	}
	
	public static function getDebug():Debug {
		if( debug == null ) debug = new Debug();
		return debug;
	}
	
	public function showDebug(showFps:Boolean,showMem):void {
		getFPS();
		var mem:String = Number( System.totalMemory / 1024 / 1024 ).toFixed( 2 ) + "Mb";
		if (EventsListener.debug) {
			debugBox.visible = true;
			
			debugBox.text = String("Debug: \n");
			if (showFps)
				debugBox.appendText(String("FPS: " + fps + "\n"));
				debugBox.appendText(String("Mem: " + mem + "\n")); 
		} else {
			debugBox.visible = false;
		}
	}
	
	public function getFPS():Number {
		frames+=1;
		curTimer=getTimer();
		if(curTimer-prevTimer>=1000){
			fps = Number(Math.round(frames*1000/(curTimer-prevTimer)));
			prevTimer=curTimer;
			frames=0;
			return fps;
		}
		return 0;
	}
	
	
}
}