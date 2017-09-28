package;

import js.Lib;

class Main {
	
	static function main() {
		
		startExample();
		
	}
	
	static function startExample():Void {
		
		var firstArr:Array<Int> = [];
		var neededValue:Int = 0;
		
		for (i in 0...10) {
			firstArr[i] = Std.int(Math.random() * 100);
		}
		
		trace("Unsorted array: \n" + firstArr.toString() + "\n");
		
		sortInsertion(firstArr);
		
		trace("\nSorted array: \n" + firstArr.toString());
		
		neededValue = 63;
		
		var needed:Int = findInSortedArray(neededValue, firstArr);
		
		if (needed >= 0) {
			trace("* * * * We found " + neededValue + ", it was on " + ++needed + "th position of our array");
		} else {
			trace("= = = = Sorry, the " + neededValue + " was not found or error occured during search");
		}
		
	}
	
	static function sortInsertion(arr:Array<Int>): Void {
		
		if (arr.length < 2) {
			trace("Sorry, current array too short");
			return;
		}
		
		var tempValue:Int = 0;
		var counter:Int = 0;
		
		if (arr[0] > arr[1]) {
			tempValue = arr[0];
			arr[0] = arr[1];
			arr[1] = tempValue;
		}
		
		for (i in 1...arr.length - 1) {
			if (arr[i] > arr[i + 1]) {
				
				tempValue = arr[i + 1];
				arr[i + 1] = arr[i];
				
				counter = i;
				
				while (tempValue < arr[counter - 1] && counter >= 0){
					
					arr[counter] = arr[counter - 1];
					
					counter--;
				}
				
				arr[counter] = tempValue;
			}
		}
	}
	
	
	static function findInSortedArray(value:Int, arr:Array<Int>):Int {
		
		if (arr.length < 2) {
			if (value == arr[0]) {
				return 0;
			} else {
				trace("Sorry, current array too short for search");
				return -1;
			}
		} 
		
		var tempArr:Array<Int> = [];
		var reverseFlag:Bool = false;
		var middle:Int = 0;
		var cellIndex:Int = 0;
		
		tempArr = arr.copy();
		
		if (arr[0] > arr[1]) {
			tempArr.reverse();
			reverseFlag = true;
		}
		
		cellIndex = middle = Std.int(tempArr.length / 2);
		
		while (tempArr.length > 0) {
			if (value < tempArr[middle] && middle > 0) {
				tempArr = tempArr.slice(0, middle);
				middle = Std.int(tempArr.length / 2);
				cellIndex -= Math.round(tempArr.length / 2);
				
			} else if (value > tempArr[middle] && middle > 0){
				tempArr = tempArr.slice(middle);
				middle = Std.int(tempArr.length / 2);
				cellIndex += middle;
				
			} else {
				if (value == tempArr[middle] && middle == 0) {
					return 0;	
				} else {
					break;
				}
			}
		}
		
		if (cellIndex >= 0 && middle != 0){
			if (reverseFlag == false) {			
				return cellIndex;
			} else {
				return arr.length - cellIndex - 1;
			}
		} else {
			return -1;
		}
	}
}
