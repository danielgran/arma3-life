/*
	Author: Duckfine

    Description:
        Initialization of MVS = MissionVoteSystem

*/


dck_mvs_availableMissions =
[
	["defeatAltisKavala.Altis", true],
	["defeatAltisNeochori.Altis", true],
	["defeatMaldenNorth.Altis", true]
];

dck_mvs = true;
publicVariable "dck_mvs";

// preprocessFileLineNumbers "\duckoth\functions\missionVoteSystem\fnc_changeMission.sqf"; //Add Function for Mission Change


// todo some sort of handler when mission ends or points etc are reached so the server recognizes that he has to swap mission