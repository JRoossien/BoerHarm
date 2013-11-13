package nl.josroossien.edugame.levels {
import flash.events.Event;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

import nl.josroossien.edugame.builders.LevelManager;
import nl.josroossien.edugame.builders.Puzzle;
import nl.josroossien.edugame.builders.SoundManager;
import nl.josroossien.edugame.core.EduGame;
import nl.josroossien.edugame.display.GameS;
import nl.josroossien.edugame.display.MenuS;
import nl.josroossien.edugame.objects.Block;
import nl.josroossien.edugame.objects.Button;
import nl.josroossien.edugame.objects.PuzzleItem;

public class WinterPuzzle extends Puzzle{
	
	public static var winterPuzzle:WinterPuzzle;
	private var winterText:TextField = new TextField();  
	private var puzzleItem1:PuzzleItem;
	private var puzzleItem2:PuzzleItem;
	private var puzzleItem3:PuzzleItem;
	private var puzzleTarget1:Block;
	private var puzzleTarget2:Block;
	private var puzzleTarget3:Block;
	private var menu:MenuS;
	private var textF:TextFormat;
	private var goodTxt:TextField = new TextField();
	
	public function WinterPuzzle() {
		winterPuzzle = this;
		
		textF = new TextFormat();
		textF.color = 0x187A0F;
		textF.size = 22;
		
		winterText.text = "Buiten sta je     .....    , tot de     .....     komt, dan     .....     je met een gil";
		winterText.width = 1024;  
		winterText.x = 0;  
		winterText.y = 600;
		winterText.autoSize = TextFieldAutoSize.CENTER;
		var textFormat:TextFormat = new TextFormat();
		textFormat.color = 0xFFFFFF;
		textFormat.size = 25;
		winterText.setTextFormat(textFormat);
		winterText.selectable = false;
		winterText.mouseEnabled = false;
		addChild(winterText);
		
		puzzleTarget1 = new Block(310,580,50,50,0xffffff);
		puzzleTarget2 = new Block(465,580,50,50,0xffffff);
		puzzleTarget3 = new Block(655,580,50,50,0xffffff);
		puzzleTarget1.alpha = .2;
		puzzleTarget2.alpha = .2;
		puzzleTarget3.alpha = .2;
		addChild(puzzleTarget1);
		addChild(puzzleTarget2);
		addChild(puzzleTarget3);
		puzzleTarget1.name = "puzzleTarget1";
		puzzleTarget2.name = "puzzleTarget2";
		puzzleTarget3.name = "puzzleTarget3";
		
		puzzleItem1 = new PuzzleItem(287,200,"smelt");
		puzzleItem2 = new PuzzleItem(487,200,"stil");
		puzzleItem3 = new PuzzleItem(687,200,"zon");
		addChild(puzzleItem1);
		addChild(puzzleItem2);
		addChild(puzzleItem3);
		addEventListener(Event.ENTER_FRAME, loop);
	}
	
	public static function getWinterBoss():WinterPuzzle {
		return winterPuzzle;
	}
	
	private function loop(e:Event):void {
		
		if (LevelManager.getLevelM().itemsCompleted == 3) {
			trace("Puzzle completed!");
			LevelManager.getLevelM().itemsCompleted = 0;
			this.removeEventListener(Event.ENTER_FRAME, loop);
			GameS.getGameS().levelS = 500;
			
			SoundManager.soundMan.playSound("win");
			
			var bl = new Block(-100,-100,1500,1000,0x187A0F);
			bl.alpha = .2;
			addChild(bl);
			
			menu = new MenuS("puzzlecomplete");
			addChild(menu);
			
			goodTxt.text = "Er was een grote boom met een droom, Hij wou zijn blaadjes bij zich houden, Maar toen werd hij verkouden!";
			goodTxt.width = 1024;  
			goodTxt.x = 0;  
			goodTxt.y = 500;
			goodTxt.autoSize = TextFieldAutoSize.CENTER;
			goodTxt.setTextFormat(textF);
			goodTxt.selectable = false;
			goodTxt.mouseEnabled = false;
			addChild(goodTxt);
		}
	}
}
}