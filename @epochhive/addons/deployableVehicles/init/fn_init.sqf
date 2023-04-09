
/*
	DV_fnc_int 
	Purpose: perform initialization needed for the mod.
	Copyright 2022 by Ghostrider-GRG 
*/

DV_deployedVehicles = [];
DV_deleteCue = [];
[] spawn DV_fnc_mainLoop; 
private _ver = getNumber(configFile >> "CfgBuild" >> "deployableVeicles" >> "version");
private _build = getNumber(configFile >> "CfgBuild" >> "deployableVeicles" >> "build");
private _date = getText(configFile >> "CfgBuild" >> "deployableVeicles" >> "date");
diag_log format["Deployable Vehicles for Epoch Server Monitor Started: Version %1 : Build %2 : Build Date %3",_ver,_build,_date];