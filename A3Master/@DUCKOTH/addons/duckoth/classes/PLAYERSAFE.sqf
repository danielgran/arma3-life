#include "\@DUCKOTH\addons\duckoth\util\oop.h"


CLASS("PLAYERSAFE")
	//private
	PRIVATE VARIABLE("string", "name");
	
	
	//Constructor
	PUBLIC FUNCTION("", "constructor") {
		MEMBER("name", "Duckfine");
	};
	
	//PUBLIC FUNCTION("", "deconstructor") {};
	
	//Methods
	PUBLIC FUNCTION("", "sayHelloWorld") {
		diag_log "HELLO WORLD";
		["New Object", 0] call DUCUT_fnc_a3logapi;
	
	};
	
	
	
	
	
	
	
	
ENDCLASS;