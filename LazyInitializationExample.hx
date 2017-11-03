package;

import js.Lib;

class Main {
	
	static function main() {
		
		var banana = Fruit.getFruitByName("Banana");
		var apple = Fruit.getFruitByName("Apple");
		var banana2 = Fruit.getFruitByName("Banana");
		
		trace(banana == banana2);
		
		Fruit.printAllTypes();
	}
	
}

class Fruit {
	
	private static var _instances = new Map<String, Fruit>();
	
	private var name(default, null):String;
	
	public function new(name:String):Void {
		this.name = name;
	}
	
	public static function getFruitByName(name:String):Fruit {
		if (!_instances.exists(name)){
			_instances.set(name, new Fruit(name));
		}
		
		return _instances.get(name);
	}
	
	public static function printAllTypes():Void {
		trace([for (key in _instances.keys()) {
			key;
		}]);
	}
}
