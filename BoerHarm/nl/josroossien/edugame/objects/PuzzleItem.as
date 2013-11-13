package nl.josroossien.edugame.objects {
import flash.display.DisplayObject;
import flash.display.MovieClip;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

import flashx.textLayout.elements.BreakElement;

import nl.josroossien.edugame.builders.LevelManager;
import nl.josroossien.edugame.levels.WinterPuzzle;
import nl.josroossien.edugame.objects.Block;

public class PuzzleItem extends MovieClip {
	
	public static var puzzleItem:PuzzleItem;
	private var block:Block;
	private var itemLabel:TextField = new TextField();  
	private var startX:Number;
	private var startY:Number;
	
	public function PuzzleItem(xPos:Number,yPos:Number,item:String) {
		puzzleItem = this;
		setImage(item,xPos,yPos);
		this.x = -50;
		this.y = -50;
		this.width = 100;
		this.height = 100;
		this.addEventListener(MouseEvent.MOUSE_DOWN, dragItem);
		this.addEventListener(MouseEvent.MOUSE_UP, dropItem);
	}
	
	public static function getPuzzleItem():PuzzleItem {
		return puzzleItem;
	}
	
	private function dragItem(event:MouseEvent):void {
		if (event.target.width < 100) {
			event.target.width = 100;
			event.target.height = 100;
			event.target.y -= 200;
			LevelManager.getLevelM().itemsCompleted--;
			return;
		}
		event.target.startDrag(true);
		startX = event.target.x;
		startY = event.target.y;
		event.target.alpha = .3;
	}
	private function dropItem(event:MouseEvent):void {
		event.target.stopDrag();
		event.target.alpha = 1;
		var myTargetName:String = "target" + event.target.name;
		var myTarget:DisplayObject = getChildByName(myTargetName);
		if (event.target.dropTarget == null) {
			event.target.x = startX;
			event.target.y = startY;;
			return;
		}
		trace("dropTarget: " + event.target.dropTarget.name + "    target: "  + event.target.name);
		if (event.target.dropTarget.name == event.target.name){
			event.target.buttonMode = false;
			event.target.alpha = .8;
			event.target.width = 50;
			event.target.height = 50;
			event.target.dropTarget.alpha = .3;
			LevelManager.getLevelM().itemsCompleted++;
			return;
		}
		event.target.x = startX;
		event.target.y = startY;
	}
	
	private function setImage(image:String,xPos:Number,yPos:Number) {
		switch (image) {
			case "stil":
				var stil:ItemStil = new ItemStil();
				stil.x = xPos;
				stil.y = yPos;
				stil.width = 100;
				stil.height = 100;
				addChild(stil);
				stil.name = "puzzleTarget1";
				break;
			case "smelt":
				var smelt:ItemSmelt = new ItemSmelt();
				smelt.x = xPos;
				smelt.y = yPos;
				smelt.width = 100;
				smelt.height = 100;
				addChild(smelt);
				smelt.name = "puzzleTarget3";
				break;
			case "zon":
				var zon:ItemZon = new ItemZon();
				zon.x = xPos;
				zon.y = yPos;
				zon.width = 100;
				zon.height = 100;
				addChild(zon);
				zon.name = "puzzleTarget2";
				break;
			case "verkouden":
				var verkouden:ItemVerkouden = new ItemVerkouden();
				verkouden.x = xPos;
				verkouden.y = yPos;
				verkouden.width = 100;
				verkouden.height = 100;
				addChild(verkouden);
				verkouden.name = "puzzleTarget3";
				break;
			case "droom":
				var droom:ItemDroom = new ItemDroom();
				droom.x = xPos;
				droom.y = yPos;
				droom.width = 100;
				droom.height = 100;
				addChild(droom);
				droom.name = "puzzleTarget1";
				break;
			case "bladeren":
				var bladeren:ItemBladeren = new ItemBladeren();
				bladeren.x = xPos;
				bladeren.y = yPos;
				bladeren.width = 100;
				bladeren.height = 100;
				addChild(bladeren);
				bladeren.name = "puzzleTarget2";
				break;
			case "haas":
				var haas:ItemHaas = new ItemHaas();
				haas.x = xPos;
				haas.y = yPos;
				haas.width = 100;
				haas.height = 100;
				addChild(haas);
				haas.name = "puzzleTarget2";
				break;
			case "kijk":
				var kijk:ItemKijk = new ItemKijk();
				kijk.x = xPos;
				kijk.y = yPos;
				kijk.width = 100;
				kijk.height = 100;
				addChild(kijk);
				kijk.name = "puzzleTarget1";
				break;
			case "ei":
				var ei:ItemEi = new ItemEi();
				ei.x = xPos;
				ei.y = yPos;
				ei.width = 100;
				ei.height = 100;
				addChild(ei);
				ei.name = "puzzleTarget3";
				break;
			case "plant":
				var plant:ItemPlant = new ItemPlant();
				plant.x = xPos;
				plant.y = yPos;
				plant.width = 100;
				plant.height = 100;
				addChild(plant);
				plant.name = "puzzleTarget1";
				break;
			case "mug":
				var mug:ItemMug = new ItemMug();
				mug.x = xPos;
				mug.y = yPos;
				mug.width = 100;
				mug.height = 100;
				addChild(mug);
				mug.name = "puzzleTarget2";
				break;
			case "stop":
				var stop:ItemStop = new ItemStop();
				stop.x = xPos;
				stop.y = yPos;
				stop.width = 100;
				stop.height = 100;
				addChild(stop);
				stop.name = "puzzleTarget3";
				break;
			default:
				trace("ERROR: Unknown item to display!");
		}
	}
}
}