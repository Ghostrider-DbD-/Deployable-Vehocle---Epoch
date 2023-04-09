
/*

	Merge the code below with your init.sqf 
	 
	 OR 

	 Use this file if you do not already have an init.sqf 
*/

if(hasInterface) then{
	DV_fnc_canStow = {
		if (isNull(player getVariable["DV",objNull])) exitWith {false};  // case of no deployed vehicle 
		//diag_log format["players current DV = %1 | _isCar %2",player getVariable["DV",objNull],(player getVariable["DV",objNull]) isKindOf "Car"];		
		if (cursorObject isEqualTo (player getVariable["DV",objNull])) exitWith {true};
		//if (player getVariable["DV",objNull] isKindOf "Car") exitWith {true};
		false
	};	
};



