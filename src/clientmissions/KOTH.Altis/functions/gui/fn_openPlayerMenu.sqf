/*
	Author: Duckfine
	Preloads Data for Playermenu and inserts it when ready
*/

/*
ducp_ID 	1016	
ducp_name	1017
ducp_rank 	1018
ducp_banned 1019
ducp_xp 	1020
ducp_level 	1021
ducp_money 	1022
ducp_kills	1024
ducp_teamkills 	1023
ducp_deaths 1025
*/

createDialog "DUC_playerMenu";

waitUntil { !isNull findDisplay 1500 }; //Wait for the Display to be ready

_uid = getPlayerUID player;

ctrlSetText [1015, str _uid];
ctrlSetText [1016, ducp_ID];
ctrlSetText [1017, ducp_name];
ctrlSetText [1018, str ducp_rank];
ctrlSetText [1019, str ducp_banned];
ctrlSetText [1020, str ducp_xp ];
ctrlSetText [1021, str ducp_level];
ctrlSetText [1022, str ducp_money];
ctrlSetText [1023, str ducp_teamkills];
ctrlSetText [1024, str ducp_kills];
ctrlSetText [1025, str ducp_deaths];


