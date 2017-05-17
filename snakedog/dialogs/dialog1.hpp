class StartDialog
    {
        idd = 10000;
        movingenable = 0;

        class controlsBackground
        {
          class background: RscText
          {
          	idc = 1000;
          	x = 0.376249 * safezoneW + safezoneX;
          	y = 0.236 * safezoneH + safezoneY;
          	w = 0.2475 * safezoneW;
          	h = 0.528 * safezoneH;
          	colorBackground[] = {-1,-1,-1,0.5};
          };
          class header: RscText
          {
          	idc = 1001;
          	text = "Operation dialog by SnakeDog"; //--- ToDo: Localize;
          	x = 0.4175 * safezoneW + safezoneX;
          	y = 0.247 * safezoneH + safezoneY;
          	w = 0.165 * safezoneW;
          	h = 0.044 * safezoneH;
          	colorBackground[] = {-1,-1,-1,0.6};
          };
          class header_left: RscText
          {
          	idc = 1002;
          	x = 0.37625 * safezoneW + safezoneX;
          	y = 0.247 * safezoneH + safezoneY;
          	w = 0.04125 * safezoneW;
          	h = 0.044 * safezoneH;
          	colorBackground[] = {-1,-1,-1,0.6};
          };
          class header_right: RscText
          {
          	idc = 1003;
          	x = 0.5825 * safezoneW + safezoneX;
          	y = 0.247 * safezoneH + safezoneY;
          	w = 0.04125 * safezoneW;
          	h = 0.044 * safezoneH;
          	colorBackground[] = {-1,-1,-1,0.6};
          };
        };
        class Controls
        {
          class combat_ops: RscButton
          {
          	idc = 1600;
          	text = "Combat Operations"; //--- ToDo: Localize;
          	x = 0.438125 * safezoneW + safezoneX;
          	y = 0.313 * safezoneH + safezoneY;
          	w = 0.12375 * safezoneW;
          	h = 0.044 * safezoneH;
            action = "closeDialog 0;[[[],'snakedog\dialogs\CombatOperations.sqf'],'BIS_fnc_execVM',true] call BIS_fnc_MP;";
          };
          class support_ops: RscButton
          {
          	idc = 1601;
          	text = "Support Operations"; //--- ToDo: Localize;
          	x = 0.438125 * safezoneW + safezoneX;
          	y = 0.379 * safezoneH + safezoneY;
          	w = 0.12375 * safezoneW;
          	h = 0.044 * safezoneH;
            action = "closeDialog 0;[[[],'snakedog\dialogs\SupportOperations.sqf'],'BIS_fnc_execVM',true] call BIS_fnc_MP;";
          };
        };
    };








////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
