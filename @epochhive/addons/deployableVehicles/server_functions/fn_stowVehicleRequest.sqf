/*
	DV_fnc_stowVehicleRequest 
	Purpose: handle a requset to stow a deployable vehicle. 
	Copyright 2022 by Ghostrider-GRG 
*/

params["_player"];
private _stowed = _player getVariable["DV_stowed",false];
if (_stowed) exitWith {["Oops, you have already stowed one deployable vehicle",5] remoteExec ["EPOCH_Message",_player]};
private _veh = _player getVariable["DV",objNull];
private _owner = _veh getVariable["DV_owner",0];
//diag_log format["StowVehicleRequest: _player %1 | _vehicle %2 | playerUID %3 | _owner %4",_player,_veh, getPlayerUID _player, _owner];
if !((getPlayerUID _player) isEqualTo _owner) exitWith {["Unable to stow: you are not the owner of this deployable vehicle",5] remoteExec["EPOCH_Message",_player]};
if (isNull _veh) exitWith {["Something went wrong: no deployable vehicle was linked to your character",5] remoteExec ["EPOCH_Message",_plyaer]};
_player setVariable["DV",objNull,true];
_player setVariable["DV_damage",damage _veh];
_player setVariable["DV_hitPoints",getAllHitPointsDamage _veh];
_player setVariable["DV_fuel",fuel _veh];
_player setVariable["DV_stowed",true];
_veh call DV_fnc_deleteVehicle;
["your deployable vehicle has been stowed",5] remoteExec ["EPOCH_Message",_player];