package;

import js.Lib; 

typedef Point = { x:Int, y:Int}

typedef ThirdD = { > Point, z:Int }		// > - inheritance from typeDef "Point"
 
class Main {
	static var endPoint:ThirdD;
	
	static function main() {
		
		endPoint = {x:5, y:8, z:10 };
		
		trace("3D-dimension point, coord by axle Z: " + endPoint.z);
	}
}
