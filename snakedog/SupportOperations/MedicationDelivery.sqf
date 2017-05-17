/*
Random Task script
by SnakeDog
*/

// WAIT FOR PLAYER SYNCHRONIZATION
[] execVM "JIP\waitforJIP.sqf";

  _myHint ="Requesting Support Operation";
  GlobalHint = _myHint;
  publicVariable "GlobalHint";
  hintsilent parseText _myHint;
  sleep 10;

  _markerArray = ["meddelivery","meddelivery_1","meddelivery_2","meddelivery_3","meddelivery_4"];    //Create marker with the names in the array in the 2D editor
  _rnd    = floor (random (count(_markerArray)));
  _mrkSpawnSite = getMarkerPos (_markerArray select _rnd);

  hint "Support Operations updated";

// Creating the marker
  _markerSO = createMarker ["meddelivery", _mrkSpawnSite];
  _markerSO setMarkerType "hd_objective";
  _markerSO setMarkerSize [1,1];
  _markerSO setMarkerColor "ColorRed";

// Creating Task
  [player,"Task_3",["Wir müssen an die Bevölkerung dringend benötigte Medikamente liefern. Wenn Sie an den Bestimmungsort angekommen sind, dann warten Sie so lange die Medikamente abgeladen werden.","Lieferung von Medikamenten","Lieferung von Medikamenten"],"meddelivery",False] call BIS_fnc_taskCreate;
  ["Task_3","Created"] call BIS_fnc_taskSetState;

// Creating Group to Defend the position
  _grp1def = [getMarkerPos _markerSO, East, (configfile >> "CfgGroups" >> "East" >> "OPF_T_F" >> "Infantry" >> "O_T_InfSquad")] call BIS_fnc_spawnGroup;
  nul = [_grp1def,getMarkerPos _markerSO, 100] call BIS_fnc_taskPatrol;
  _grp2def = [getMarkerPos _markerSO, East, (configfile >> "CfgGroups" >> "East" >> "OPF_T_F" >> "Infantry" >> "O_T_InfSquad")] call BIS_fnc_spawnGroup;
  nul = [_grp2def,getMarkerPos _markerSO, 100] call BIS_fnc_taskPatrol;
  sleep 5;

  _myHint ="Der Liferwagen wird vorbereitet";
  GlobalHint = _myHint;
  publicVariable "GlobalHint";
  hintsilent parseText _myHint;
  sleep 5;

  _myHint ="Der Lieferung ist fertig und steht vor unsere Einsatzfahrzeuge";
  GlobalHint = _myHint;
  publicVariable "GlobalHint";
  hintsilent parseText _myHint;

// Creating the vehicle
  _eng = createVehicle ["B_Truck_01_covered_F",[(getMarkerpos "vehiclespawn" select 0) + 0, getMarkerpos "vehiclespawn" select 1,0],[], 0, "NONE"];
	_eng setFuel 1;
	_eng allowDammage true;

// Wait for task conditions
  waitUntil { _eng distance getMarkerpos _markerSO < 10 OR !alive _eng };

// If task failed
  if (!alive _eng) exitWith {_null = ["Task_3","Failed"] call BIS_fnc_taskSetState; deleteMarker _markerSO; deletevehicle _eng;};

  ["Task_3"] call BIS_fnc_deleteTask;

// If task succeeded
  _myHint ="Der Liferwagen wird entladen. Warten Sie bis der Wagen vollständig entladen wurde";
  GlobalHint = _myHint;
  publicVariable "GlobalHint";
  hintsilent parseText _myHint;
  sleep 5;

  _myHint ="Die Medikamente wurden erfolgreich ausgeliefert. Kehren Sie in die Operationsbasis zurück";
  GlobalHint = _myHint;
  publicVariable "GlobalHint";
  hintsilent parseText _myHint;
  sleep 5;

  ["Task_3","Succeeded"] call BIS_fnc_taskSetState;
  deleteMarker _markerSO; deletevehicle _eng;
  ["Task_3"] call BIS_fnc_deleteTask;
