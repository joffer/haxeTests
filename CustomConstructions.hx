package js;

class CustomConstructions {

	public static function getRandomArray(?length:Int):Array<Int> {
		var array:Array<Int> = [];
		
		if (length == 0) {
			return array;
			
		} else if (length > 0){
			for (i in 0...length){
				array[i] = Std.int(Math.random() * 100);
			}
			
		} else {
			length = -length;
			for (i in 0...length){
				array[i] = Std.int(Math.random() * 100) * -1;
			}
		}
		
		return array;
	}
}
