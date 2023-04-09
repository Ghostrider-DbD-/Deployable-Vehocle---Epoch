/*

	Merge with your CfgActionMenu_self.hpp

*/

class deployVehicle 
{
	condition = "isNull(player getVariable['DV',objNull])";
	action = "[player] remoteExec ['DV_fnc_spawnVehicleRequest',2]";
	icon = "\x\addons\a3_epoch_community\markers\marker_icon_quad.paa";
	toolTip = "Spawn Deployable Vehicle";
};