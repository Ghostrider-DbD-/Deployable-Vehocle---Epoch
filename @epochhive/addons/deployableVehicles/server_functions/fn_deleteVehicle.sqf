/*
	DV_fnc_deleteVehicle 
	Purpose: handle case where it is time to delete a deployed vehicle from the server and stop monitoring it.
	Copyright 2022 by Ghostrider-GRG 
*/

params["_veh"];
//diag_log format["DV_fnc_deleteVehicle called with _veh = %1",_veh];
DV_deployedVehicles deleteAt (DV_deployedVehicles find _veh);
deleteVehicle _veh;