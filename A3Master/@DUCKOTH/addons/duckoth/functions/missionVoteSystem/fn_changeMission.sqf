/*
	Author: Duckfine

    Description:
        Changes the ongoing mission on Server

	Params:
        0: name of mission
*/
params[_missionName];


if (_missionName == "") then
{
    //todo write error that mission change has failed
    return;
};

"penis" serverCommand format["#mission %1", _missionName];

//password serverCommand format["#mission %1, _missionName];

