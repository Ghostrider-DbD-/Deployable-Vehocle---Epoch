/*
	DV_fnc_spawnVehicleRequest 
	Purpose: handle a request from a player to spawn a depolyable vehicle 
	Copyright 2022 by Ghostrider-GRG 
*/

params["_player"];
private _stowed = _player getVariable["DV_stowed",false];
_player setVariable["DV_stowed",false,true];
private _vehClass = getText(configFile >> "CfgDeployableVehicles" >> "vehicleType");
private _veh = createVehicle[_vehClass, getPosATL _player, [], 5, "NONE"];
_veh call EPOCH_server_setVToken;
_veh setVariable["DV_lastUsed",diag_tickTime];
_veh setVariable["DV_owner",getPlayerUID _player,true];
_veh setVariable["DV_player",_player];
_player setVariable["DV",_veh,true];
//[format["DV set to %1 for player 52",_veh,_player]] remoteExec["diag_log",_player];
if (_stowed) then 
{
	_veh setDamage (_player getVariable["DV_damage",0]);
	_veh setFuel (_player getVariable["DV_fuel",1]);
	private _hitPoints = _player getVariable["DV_hitPoints",[]];
	/*
	{
		//_veh setHit[_x select 0, _x select 2];
		diag_log format["DV_fnc_spawnVehicleRequest: _veh %1 | _hitpoints %2 = %3",_veh, _forEachIndex, _x];
	} forEach _hitPoints;
	*/
};
DV_deployedVehicles pushBack _veh;
private _msg = "Your ride has been spawned somewhere closeby";
_msg remoteExec ["systemchat",_player];
//_msg remoteExec ["diag_log",_player];
["Your ride has been spawned somewhere closeby",5] remoteExec ["EPOCH_Message",_player];
//[format["Player %1 spawned DV %2 with getVariable['DV',objNull] = %3",_player,_veh,_player getVariable["DV",objNull]]] remoteExec["diag_log",_player];
