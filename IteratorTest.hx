package;

import js.Browser;
import js.Lib;

class Main {
	
	static function main() {
		
		// TEST I
		//var iter = new IntIter(0, 10);
		//
		//for (i in iter) {
			//trace(i);
		//}
		
		// TEST II
		//var tileSize = 90;
		//var tileMargin = 3;
		//for (grid in new GridIterator(10, 10)) {
			//var div = Browser.document.createDivElement();
			//div.style.width = tileSize + "px";
			//div.style.height = tileSize + "px";
			//div.style.position = "absolute";
			//div.style.left = (grid.x * (tileSize + tileMargin)) + "px";
			//div.style.top = (grid.y * (tileSize + tileMargin)) + "px";
			//div.style.background = "#5555";
			//
			//Browser.document.body.appendChild(div);
		//}
		
		// TEST III
		//for (i in new ReversIterator(10, 0)) {
			//trace(i);
		//}
		
		// TEST IV
		//for (i in new StepIterator(0, 10, 2)) {
			//trace(i);
		//}
	}
}

class IntIter {
	var min:Int;
	var max:Int;
	
	public function new(min:Int, max:Int){
		this.min = min;
		this.max = max;
	}
	
	public function hasNext(){
		return(min < max);
	}
	
	public function next(){
		return min += 2;
	}
}

class GridIterator {
	var gridWidth:Int = 0;
	var gridHeight:Int = 0;
	var i:Int = 0;
	
	public inline function new(gridWidth:Int, gridHeight:Int){
		this.gridWidth = gridWidth;
		this.gridHeight = gridHeight;
	}
	
	public inline function hasNext() {
		return i < gridWidth * gridHeight;
	}
	
	public inline function next(){
		return new GridIteratorObject(i++, gridWidth);
	}
}

class GridIteratorObject {

	public var index(default, null):Int;
	public var x(default, null):Int;
	public var y(default, null):Int;
	
	public inline function new(index:Int, gridWidth:Int) {
		this.index = index;
		this.x = index % gridWidth;
		this.y = Std.int(index / gridWidth);
		trace('index: $index, X: $this.x');
	}
}

class ReversIterator {
	var i:Int;
	var end:Int;
	
	public inline function new(start:Int, end:Int){
		this.i = start;
		this.end = end;
	}
	
	public inline function hasNext(){
		return i >= end;
	}
	
	public inline function next(){
		return i--;
	}
}

class StepIterator {
	var end:Int;
	var step:Int;
	var index:Int;
	
	public inline function new(start:Int, end:Int, step:Int){
		this.index = start;
		this.end = end;
		this.step = step;
	}
	
	public inline function hasNext(){
		return index < end;
	}
	
	public inline function next(){
		return (index += step) - step;
	}
}
