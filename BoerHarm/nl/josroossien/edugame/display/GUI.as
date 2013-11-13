package nl.josroossien.edugame.display {
import flash.display.MovieClip;
import flash.events.Event;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

import nl.josroossien.edugame.builders.LevelManager;
import nl.josroossien.edugame.objects.Player;

public class GUI extends MovieClip {
	
	public static var gui:GUI;
	
	private var healthBarOutside:HealthBarOut;
	private var healtBar:HealthBarIn;
	private var kr:Kruiwagen;
	private var pot:Potato;
	private var mosquito:Mosquito;
	private var bee:Bee;
	private var spider:Spider;
	private var pinguin:Pinguin;
	private var collected:Number = 0;
	private var textFormat:TextFormat;
	private var potTxt:TextField = new TextField();
	private var killTxt:TextField = new TextField();
	private var item1Txt:TextField = new TextField();
	private var item2Txt:TextField = new TextField();
	private var item3Txt:TextField = new TextField();
	
	public function GUI() {
		gui = this;
		createGUI();
		addEventListener(Event.ENTER_FRAME, updateGUI);
	}
	
	public function getGUI():GUI {
		return gui;
	}
	
	private function createGUI():void {
		healthBarOutside = new HealthBarOut();
		healtBar = new HealthBarIn();
		addChild(healthBarOutside);
		healthBarOutside.addChild(healtBar);
		healthBarOutside.x = 900;
		healthBarOutside.y = 20;
		healtBar.x = 1;
		healtBar.y = 1;
		
		textFormat = new TextFormat();
		textFormat.color = 0xFFFFFF;
		textFormat.size = 22;
		
		if (LevelManager.getLevelM().boss == false) {
			kr = new Kruiwagen();
			addChild(kr);
			kr.x = 100;
			kr.y = 20;
			
			kr = new Kruiwagen();
			addChild(kr);
			kr.x = 250;
			kr.y = 20;
			
			kr = new Kruiwagen();
			addChild(kr);
			kr.x = 400;
			kr.y = 20;
			
			pot = new Potato();
			addChild(pot);
			pot.x = 600;
			pot.y = 50;
			pot.width = 50;
			pot.height = 50;
			
			potTxt.text = "0";
			potTxt.width = 50;  
			potTxt.x = 572;  
			potTxt.y = 38;
			potTxt.autoSize = TextFieldAutoSize.CENTER;
			potTxt.setTextFormat(textFormat);
			potTxt.selectable = false;
			potTxt.mouseEnabled = false;
			addChild(potTxt);
			
			if (LevelManager.getLevelM().levelID == 1) {
				mosquito = new Mosquito();
				addChild(mosquito);
				mosquito.stop();
				mosquito.x = 650;
				mosquito.y = 25;
				mosquito.width = 50;
				mosquito.height = 45;
			}
			if (LevelManager.getLevelM().levelID == 2) {
				bee = new Bee();
				addChild(bee);
				bee.stop();
				bee.x = 650;
				bee.y = 25;
				bee.width = 60;
				bee.height = 50;
			}
			if (LevelManager.getLevelM().levelID == 3) {
				spider = new Spider();
				addChild(spider);
				spider.stop();
				spider.x = 650;
				spider.y = 25;
				spider.width = 50;
				spider.height = 50;
			}
			if (LevelManager.getLevelM().levelID == 4) {
				pinguin = new Pinguin();
				addChild(pinguin);
				pinguin.stop();
				pinguin.x = 650;
				pinguin.y = 25;
				pinguin.width = 45;
				pinguin.height = 50;
			}
			
			killTxt.text = "0";
			killTxt.width = 50;  
			killTxt.x = 656;  
			killTxt.y = 38;
			killTxt.autoSize = TextFieldAutoSize.CENTER;
			killTxt.setTextFormat(textFormat);
			killTxt.selectable = false;
			killTxt.mouseEnabled = false;
			addChild(killTxt);
			
			item1Txt.text = "";
			item1Txt.width = 100;  
			item1Txt.x = 125;  
			item1Txt.y = 70;
			item1Txt.autoSize = TextFieldAutoSize.CENTER;
			item1Txt.setTextFormat(textFormat);
			item1Txt.selectable = false;
			item1Txt.mouseEnabled = false;
			addChild(item1Txt);
			
			item2Txt.text = "";
			item2Txt.width = 100;  
			item2Txt.x = 275;  
			item2Txt.y = 70;
			item2Txt.autoSize = TextFieldAutoSize.CENTER;
			item2Txt.setTextFormat(textFormat);
			item2Txt.selectable = false;
			item2Txt.mouseEnabled = false;
			addChild(item2Txt);
			
			item3Txt.text = "";
			item3Txt.width = 100;  
			item3Txt.x = 425;  
			item3Txt.y = 70;
			item3Txt.autoSize = TextFieldAutoSize.CENTER;
			item3Txt.setTextFormat(textFormat);
			item3Txt.selectable = false;
			item3Txt.mouseEnabled = false;
			addChild(item3Txt);
		}
	}
	
	public function fillInv(item:MovieClip):void {
		if (collected == 0) {
			item1Txt.text = item.name;
			item1Txt.setTextFormat(textFormat);
			collected++
			addChild(item);
			item.rotation = 90;
			item.x = 170;
			item.y = 40;
			
		} else if (collected == 1) {
			item2Txt.text = item.name;
			item2Txt.setTextFormat(textFormat);
			collected++
			addChild(item);
			item.rotation = 90;
			item.x = 320;
			item.y = 40;
		} else if (collected == 2) {
			item3Txt.text = item.name;
			item3Txt.setTextFormat(textFormat);
			collected++;
			addChild(item);
			item.rotation = 90;
			item.x = 470;
			item.y = 40;
		} else {
			trace("INFO: Inventory full can't place item.");
		}
	}
	
	private function updateGUI(e:Event):void {
		healtBar.width = Player.getPlayer().phealth;
		potTxt.text = String((LevelManager.getLevelM().LvlPotato.length - 9) * -1);
		potTxt.setTextFormat(textFormat);
		killTxt.text = String(GameS.getGameS().kills);
		killTxt.setTextFormat(textFormat);
	}
}
}