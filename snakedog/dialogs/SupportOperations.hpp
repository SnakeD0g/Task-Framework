class SupportOperations
    {
        idd = 12000;
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
						x = 0.443281 * safezoneW + safezoneX;
						y = 0.247 * safezoneH + safezoneY;
						w = 0.139219 * safezoneW;
						h = 0.044 * safezoneH;
						colorBackground[] = {-1,-1,-1,0.6};
					};
					class header_left: RscText
					{
						idc = 1002;
						x = 0.37625 * safezoneW + safezoneX;
						y = 0.247 * safezoneH + safezoneY;
						w = 0.0670312 * safezoneW;
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
					class combat_patrol: RscButton
					{
						idc = 1600;
						text = "Medication delivery"; //--- ToDo: Localize;
						x = 0.422655 * safezoneW + safezoneX;
						y = 0.313 * safezoneH + safezoneY;
						w = 0.154687 * safezoneW;
						h = 0.033 * safezoneH;
						action = "closeDialog 0;[[[],'snakedog\SupportOperations\MedicationDelivery.sqf'],'BIS_fnc_execVM',true] call BIS_fnc_MP;";
					};

					class capture_warlord: RscButton
					{
						idc = 1601;
						text = "Lorem ipsum"; //--- ToDo: Localize;
						x = 0.422655 * safezoneW + safezoneX;
						y = 0.368 * safezoneH + safezoneY;
						w = 0.154687 * safezoneW;
						h = 0.033 * safezoneH;
					};
					class area_clear: RscButton
					{
						idc = 1602;
						text = "Lorem ipsum"; //--- ToDo: Localize;
						x = 0.422655 * safezoneW + safezoneX;
						y = 0.423 * safezoneH + safezoneY;
						w = 0.154687 * safezoneW;
						h = 0.033 * safezoneH;
					};
					class search_destroy_drugs: RscButton
					{
						idc = 1603;
						text = "Lorem ipsum"; //--- ToDo: Localize;
						x = 0.422656 * safezoneW + safezoneX;
						y = 0.478 * safezoneH + safezoneY;
						w = 0.154687 * safezoneW;
						h = 0.033 * safezoneH;
					};
					class search_destroy_supplies: RscButton
					{
						idc = 1604;
						text = "Lorem ipsum"; //--- ToDo: Localize;
						x = 0.422656 * safezoneW + safezoneX;
						y = 0.533 * safezoneH + safezoneY;
						w = 0.154687 * safezoneW;
						h = 0.033 * safezoneH;
					};
					class search_destroy_campsite: RscButton
					{
						idc = 1605;
						text = "Lorem ipsum"; //--- ToDo: Localize;
						x = 0.422657 * safezoneW + safezoneX;
						y = 0.588 * safezoneH + safezoneY;
						w = 0.154687 * safezoneW;
						h = 0.033 * safezoneH;
					};
					class search_destroy_mobile_comm: RscButton
					{
						idc = 1606;
						text = "Lorem ipsum"; //--- ToDo: Localize;
						x = 0.422656 * safezoneW + safezoneX;
						y = 0.643 * safezoneH + safezoneY;
						w = 0.154687 * safezoneW;
						h = 0.033 * safezoneH;
					};
					class search_destroy_anti_air: RscButton
					{
						idc = 1607;
						text = "Lorem ipsum"; //--- ToDo: Localize;
						x = 0.422656 * safezoneW + safezoneX;
						y = 0.698 * safezoneH + safezoneY;
						w = 0.154687 * safezoneW;
						h = 0.033 * safezoneH;
					};
        };
    };
