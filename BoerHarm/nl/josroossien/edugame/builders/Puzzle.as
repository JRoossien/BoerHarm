package nl.josroossien.edugame.builders {
import flash.display.MovieClip;

public class Puzzle extends MovieClip {
	
	public static var puzzle:Puzzle;
	
	public function Puzzle() {
		trace("puzzle working!");
		puzzle = this;
	}
	
	public static function getPuzzle():Puzzle {
		if( puzzle == null ) puzzle = new Puzzle();
		return puzzle;
	}
}
}