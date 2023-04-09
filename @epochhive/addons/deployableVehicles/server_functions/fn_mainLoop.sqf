/*
	DV_fnc_mainLoop 
	Purpose: handles monitoring of all deployed vehicles 
	Copyright 2022 by Ghostrider-GRG 
*/

private _onRoad = getNumber(configFile >> "CfgDeployableVehicles" >> "despawnTimeOnRoad");
private _offRoad = getNumber(configFile >> "CfgDeployableVehicles" >> "despawnTimeOffRoad");
while {true} do 
{
	uisleep 60; 
	for "_i" from 1 to (count DV_deployedVehicles) do 
	{
		if (_i > (count DV_deployedVehicles)) exitWith {};
		private _veh = DV_deployedVehicles deleteAt 0; 
		private _delete = false;
		if (isPlayer (driver _veh)) then 
		{
			_veh setVariable["DV_lastUsed",diag_tickTime];
			DV_deployedVehicles pushBack _veh;
		} else {
			private _lastUsed = _veh getVariable["DV_lastUsed",0];
			if (isOnRoad (getPosATL _veh)) then 
			{
				if ((diag_tickTime - _lastUsed) > _onRoad) then 
				{
					if (_veh distance (_veh getVariable ["DV_player",objNull]) > 50) then 
					{
						private _player = _veh getVariable ["DV_player",objNull];
						_player setVariable["DV",objNull,true];
						_veh call DV_fnc_deleteVehicle;
					};;
				} else {
					DV_deployedVehicles pushBack _veh;
				};
			} else {
				if ((diag_tickTime - _lastUsed) > _offRoad) then 
				{
					_veh call DV_fnc_deleteVehicle;
				} else {
					DV_deployedVehicles pushBack _veh;
				};
			};
		};
	};

	for "_i" from 1 to (count DV_deleteCue) do 
	{
		if (_i > (count DV_deleteCue)) exitWith {};
		private _vi = DV_deleteCue deleteAt 0;
		_vi params["_veh","_lastChecked"];
		if ((crew _veh) isEqualTo [] && (diag_tickTime - _lastChecked) > 60) then 
		{
			deleteVehicle _veh;
		} else {
			_vi set[1,diag_tickTime];
			DV_deleteCue pushBack _vi;
		};
	};

};