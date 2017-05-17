/*
Random Task script
by SnakeDog
*/

// WAIT FOR PLAYER SYNCHRONIZATION
[] execVM "JIP\waitforJIP.sqf";

_myHint ="Requesting Combat Operation";
GlobalHint = _myHint;
publicVariable "GlobalHint";
hintsilent parseText _myHint;

sleep 10;

_markerArray = ["destroy_1","destroy_2","destroy_3","destroy_4","destroy_5"];    //Create marker with the names in the array in the 2D editor
_rnd    = floor (random (count(_markerArray)));
_mrkSpawnSite = getMarkerPos (_markerArray select _rnd);

hint "Combat Operations updated";

// Creating the marker
_markerCO = createMarker ["destroy", _mrkSpawnSite];
_markerCO setMarkerType "hd_objective";
_markerCO setMarkerSize [1,1];
_markerCO setMarkerColor "ColorRed";

// Creating Task
[player,"Task_4",["Wir müssen Versorgungsgüter der Aufständischen suchen und zerstören. Die Versorgungsdepot werden immer stark bewacht, gehen Sie daher behutsam vor.","Versorgungsgüter zerstören","Versorgungsgüter zerstören"],"destroy",False] call BIS_fnc_taskCreate;
["Task_4","Created"] call BIS_fnc_taskSetState;

_supply = ["Box_CSAT_Equip_F","Box_FIA_Wps_F","Box_FIA_Support_F","Box_CSAT_Uniforms_F"] call BIS_fnc_selectRandom;
//_supplies = createVehicle [_supply, _markerCO, [], 0, "CAN_COLLIDE"];
_supplies = createVehicle [_supply,[(getMarkerpos "destroy" select 0) + 0, getMarkerpos "destroy" select 1,0],[], 0, "NONE"];

// Creating Group to Defend the position
_grp1def = [getMarkerPos _markerCO, East, (configfile >> "CfgGroups" >> "East" >> "OPF_T_F" >> "Infantry" >> "O_T_InfSquad")] call BIS_fnc_spawnGroup;
nul = [_grp1def,getMarkerPos _markerCO, 50] call BIS_fnc_taskPatrol;
_grp2def = [getMarkerPos _markerCO, East, (configfile >> "CfgGroups" >> "East" >> "OPF_T_F" >> "Infantry" >> "O_T_InfSquad")] call BIS_fnc_spawnGroup;
nul = [_grp2def,getMarkerPos _markerCO, 30] call BIS_fnc_taskPatrol;
_grp3def = [getMarkerPos _markerCO, East, (configfile >> "CfgGroups" >> "East" >> "OPF_T_F" >> "Infantry" >> "O_T_InfSquad")] call BIS_fnc_spawnGroup;
nul = [_grp3def,getMarkerPos _markerCO, 5] call bis_fnc_taskDefend;

// If task succeeded
waitUntil {!alive _supplies};
["Task_4","Succeeded"] call BIS_fnc_taskSetState;
deleteMarker _markerCO; deleteVehicle _supplies;
["Task_4"] call BIS_fnc_deleteTask;

_myHint ="Die Versorgungsgüter wurden erfolgreich zerstört. Kehren Sie in die Operationsbasis zurück";
GlobalHint = _myHint;
publicVariable "GlobalHint";
hintsilent parseText _myHint;
