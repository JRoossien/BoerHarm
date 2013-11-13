package nl.josroossien.edugame.display  {

import fl.transitions.easing.None;

import flash.display.MovieClip;
import flash.events.Event;

import flashx.textLayout.elements.BreakElement;

import nl.josroossien.edugame.core.EduGame;
import nl.josroossien.edugame.levels.AutumnPuzzle;
import nl.josroossien.edugame.levels.SpringPuzzle;
import nl.josroossien.edugame.levels.SummerPuzzle;
import nl.josroossien.edugame.levels.WinterPuzzle;

public class PuzzleS extends MovieClip {
	
	public static var puzzleS:PuzzleS;
	private var springPuzzle:SpringPuzzle;
	private var summerPuzzle:SummerPuzzle;
	private var autumnPuzzle:AutumnPuzzle;
	private var winterPuzzle:WinterPuzzle;
	private var puzzle:String;
	
	public function PuzzleS(puz:String) {
		trace("puzzleS");
		puzzleS = this;
		EduGame.getMain().state == "puzzle";
		
		setPuzzle(puz);
		updatePuzzle();
		
		this.addEventListener(Event.ENTER_FRAME,loop);
	}
	
	public static function getPuzzleS():PuzzleS {
		if( puzzleS == null ) puzzleS = new PuzzleS("spring");
		return puzzleS;
	}
	
	private function loop(event:Event):void {
		
	}
	
	public function updatePuzzle():void {
		
		switch (puzzle) {
			case "spring":
				springPuzzle = new SpringPuzzle();
				addChild(springPuzzle);
				springPuzzle.name = "puzzle";
				trace("Loading spring Puzzle...");
				break;
			case "summer":
				summerPuzzle = new SummerPuzzle();
				addChild(summerPuzzle);
				summerPuzzle.name = "puzzle";
				trace("Loading summer Puzzle...");
				break;
			case "autumn":
				autumnPuzzle = new AutumnPuzzle();
				addChild(autumnPuzzle);
				autumnPuzzle.name = "puzzle";
				trace("Loading autumn Puzzle...");
				break;
			case "winter":
				winterPuzzle = new WinterPuzzle();
				addChild(winterPuzzle);
				winterPuzzle.name = "puzzle";
				trace("Loading winter Puzzle...");
				break;
			default:
				trace("Unknown puzzle to update!!" + puzzle);
		}
	}
	
	public function removePuzzle(puzzle:String):void {
		switch (puzzle) {
			case "spring":
				removeChild(springPuzzle);
				break;
			case "summer":
				removeChild(summerPuzzle);
				break;
			case "autumn":
				removeChild(autumnPuzzle);
				break;
			case "winter":
				removeChild(winterPuzzle);
				break;
		}
	}
	
	public function getPuzzle():String {
		return puzzle;
	}
	
	public function setPuzzle(puz:String):void {
		puzzle = puz;
	}
}
}
