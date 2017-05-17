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

_markerArray = ["kill_1","kill_2","kill_3","kill_4","kill_5","kill_6","kill_7","kill_8","kill_9"];    //Create marker with the names in the array in the 2D editor
_rnd    = floor (random (count(_markerArray)));
_mrkSpawnSite = getMarkerPos (_markerArray select _rnd);

hint "Combat Operations updated";

// Creating the marker
_markerCO = createMarker ["kill", _mrkSpawnSite];
_markerCO setMarkerType "hd_objective";
_markerCO setMarkerSize [1,1];
_markerCO setMarkerColor "ColorRed";

// Creating Task
[player,"Task_3",["Wir müssen einen Warlord finden und gezielt ausschalten. Es ist mit starken Wiederstand zu rechnen. Nach unseren Informationen nach, wird der Zielperson stark bewacht, wir müssen also sehr behutsam vorgehen.","Gezielt eliminieren","Gezielt eliminieren"],"kill",False] call BIS_fnc_taskCreate;
["Task_3","Created"] call BIS_fnc_taskSetState;

_off = createGroup EAST;
_officer1 = _off createUnit ["O_Story_Colonel_F",[(getMarkerpos _markerCO select 0) + 3, getMarkerpos _markerCO select 1,0], [], 0, "NONE"];
_officer1 disableAI "MOVE";
_officer1 disableAI "ANIM";

// Creating Group to Defend the position
_grp1def = [getMarkerPos _markerCO, East, (configfile >> "CfgGroups" >> "East" >> "OPF_T_F" >> "Infantry" >> "O_T_InfSquad")] call BIS_fnc_spawnGroup;
nul = [_grp1def,getMarkerPos _markerCO, 50] call BIS_fnc_taskPatrol;
_grp2def = [getMarkerPos _markerCO, East, (configfile >> "CfgGroups" >> "East" >> "OPF_T_F" >> "Infantry" >> "O_T_InfSquad")] call BIS_fnc_spawnGroup;
nul = [_grp2def,getMarkerPos _markerCO, 30] call BIS_fnc_taskPatrol;
_grp3def = [getMarkerPos _markerCO, East, (configfile >> "CfgGroups" >> "East" >> "OPF_T_F" >> "Infantry" >> "O_T_InfSquad")] call BIS_fnc_spawnGroup;
nul = [_grp3def,getMarkerPos _markerCO, 5] call bis_fnc_taskDefend;

// If task succeeded
waitUntil {!alive _officer1};
["Task_3","Succeeded"] call BIS_fnc_taskSetState;
deleteMarker _markerCO; deleteGroup _off;
["Task_3"] call BIS_fnc_deleteTask;

_myHint ="Der Warlord wurde erfolgreich ausgeschaltet. Kehren Sie Operationsbasis zurück";
GlobalHint = _myHint;
publicVariable "GlobalHint";
hintsilent parseText _myHint;
