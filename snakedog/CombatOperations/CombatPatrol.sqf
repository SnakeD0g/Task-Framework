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

_markerArray = ["pat1","pat2","pat3","pat4","pat5"];    //Create marker with the names in the array in the 2D editor
_rnd    = floor (random (count(_markerArray)));
_mrkSpawnSite = getMarkerPos (_markerArray select _rnd);

hint "Combat Operations updated";

// Creating the marker
_markerCO = createMarker ["patrol", _mrkSpawnSite];
_markerCO setMarkerType "hd_objective";
_markerCO setMarkerSize [1,1];
_markerCO setMarkerColor "ColorRed";

// Creating Task
[player,"Task_2",["Wir müssen eine Erkundungsfahrt unternehmen. Wenn Sie am Zielgebiet angekommen sind, kundschaften Sie die Gegend aus und bekämpfen Sie alle Feinde die Sie begegnen.","Erkundungsfahrt","Erkundungsfahrt"],"patrol",False] call BIS_fnc_taskCreate;
["Task_2","Created"] call BIS_fnc_taskSetState;

// Creating Group to Defend the position
_grp1def = [getMarkerPos _markerCO, East, (configfile >> "CfgGroups" >> "East" >> "OPF_T_F" >> "Infantry" >> "O_T_InfSquad")] call BIS_fnc_spawnGroup;
nul = [_grp1def,getMarkerPos _markerCO, 100] call BIS_fnc_taskPatrol;
_grp2def = [getMarkerPos _markerCO, East, (configfile >> "CfgGroups" >> "East" >> "OPF_T_F" >> "Infantry" >> "O_T_InfSquad")] call BIS_fnc_spawnGroup;
nul = [_grp2def,getMarkerPos _markerCO, 100] call BIS_fnc_taskPatrol;

// If task succeeded
waitUntil {player distance getMarkerpos _markerCO < 10 };
["Task_2","Succeeded"] call BIS_fnc_taskSetState;
deleteMarker _markerCO;
["Task_2"] call BIS_fnc_deleteTask;

_myHint ="Die Erkundungsfahrt war erfolgreich. Kehren Sie in die Operationsbasis zurück";
GlobalHint = _myHint;
publicVariable "GlobalHint";
hintsilent parseText _myHint;
