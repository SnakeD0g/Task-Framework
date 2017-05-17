/*


SCRIPT:	#include "waitForJIP.sqf"
SCRIPT ORIGIN: Any script calling for player synchronization
SCRIPT INTENT: To tell a script to wait for players to be synchronized before proceeding
REMINDER: Script has to be within the same folder as the script calling it, if no folder path should be defined
*/

// SCRIPT
if	(!isDedicated && (player != player))
then
	{
    waitUntil {player == player};
    waitUntil {time > 10};
	};