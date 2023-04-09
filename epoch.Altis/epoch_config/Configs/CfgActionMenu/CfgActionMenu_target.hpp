/*

	Merge with CfgActionMenu_target.hpp

*/


class stowVehicle 
{
	condition = "call DV_fnc_canStow";
	action = "[player] remoteExec ['DV_fnc_stowVehicleRequest',2]";
	icon = "\x\addons\a3_epoch_community\markers\marker_icon_quad.paa";
	toolTip = "Stow Deployable Vehicle";
};
