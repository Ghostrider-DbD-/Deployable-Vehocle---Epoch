/*
	DV_fnc_playerDied 
	Purpose: handle processing of a deployed vehicle in the event the player who spawned it is killed. 
	Copyright 2022 by Ghostrider-GRG
*/ 

params["_player"];
//diag_log format["DV_fnc_playerDied Triggered: _this = %1 | _player = %2",_this,_player];
private _veh = _player getVariable["DV",objNull];
if !(isNull _veh) then {
	DV_deleteCue pushBack[_veh,diag_tickTime]; // aloow the vehicle to persist if it has other occupants until they get out 
	DV_deployedVehicles deleteAt (DV_deployedVehicles find _veh);
};