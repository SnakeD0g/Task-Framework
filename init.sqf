/*
Simple Init.sqf by SnakeDog
*/
// SYNC
if ((!isServer) && (player != player)) then {waitUntil {player == player};}; // Player sync
startLoadingScreen ["Loading Mission"];

// MISSION SAVES
enableSaving [FALSE,FALSE];	// [enable manual save (true or false), enable auto save (true or false)]
endLoadingScreen;

[] execVM "start_up.sqf";

//execVM "CCG\CCG_Easy_Respawn.sqf";
execVM "CCG\CCG_Support.sqf";
#include "SHK_Fastrope.sqf"

// Initialize the Halojump if you want use Halojump in your mission
// execVM "scripts\halo_jump_init.sqf";

// Initialize Task & Brifieng
// [] execVM "Tasks.sqf";
// [] execVM "Briefing.sqf";
