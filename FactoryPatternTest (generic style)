package;

import js.Lib;

class Main {
	
	static function main() {
		
		var myItem:Item<Int> = Item.create();
		myItem.value = 10;
		trace(myItem.value);
		
		var myItem2:Item<Array<Int>> = Item.create();
		myItem2.value = [1, 2, 3];
		trace(myItem2.value);
	}
}

class Item<T>{
	
	public var value:T;
	
	public static function create<T>():Item<T> {
		return new Item<T>();
	}
	
	private function new(){}
}
