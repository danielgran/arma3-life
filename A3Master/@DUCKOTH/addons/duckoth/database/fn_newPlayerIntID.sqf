/*
	Checks if there is already an unique playerintid in the database
	if there is one, search for a new one
	if there is no one existing, return freshly generated playerintid
	Layout: X00XXX00X
	example: A38var43o
	
	Author: Duckfine
*/

private["_playerIntID", "_queryStmnt", "_allowedChars", "_allowedNumbers", "_databaseResult", "_mainloop", "_mainloopcounter", "_return"];


_playerIntID = "";
_queryStmnt = "";
_databaseResult = [];
_allowedChars = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];
_allowedNumbers = [0,1,2,3,4,5,6,7,8,9];
_mainloop = true;
_mainloopcounter = 0;
_return = "";

//Randomly generate a playerintid (9 Characters)


while {_mainloop} do
{	
	_playerIntID = _playerIntID + (_allowedChars select (round (random 25)));
	_playerIntID = _playerIntID + str((_allowedNumbers select (round (random 9))));
	_playerIntID = _playerIntID + str((_allowedNumbers select (round (random 9))));
	_playerIntID = _playerIntID + (_allowedChars select (round (random 25)));
	_playerIntID = _playerIntID + (_allowedChars select (round (random 25)));
	_playerIntID = _playerIntID + (_allowedChars select (round (random 25)));
	_playerIntID = _playerIntID + str((_allowedNumbers select (round (random 9))));
	_playerIntID = _playerIntID + str((_allowedNumbers select (round (random 9))));
	_playerIntID = _playerIntID + (_allowedChars select (round (random 25)));
	
	
	_queryStmnt = format["SELECT intid FROM players WHERE intid = '%1'", _playerIntID];
	_databaseResult = [_queryStmnt, 2, (call dckdb_playerdata_id)] call DUCDB_fnc_queryHandler;
	
	
	
	if (_databaseResult isEqualTo [1001]) then //Check if the playerintid is already in the database or error
	{
		_return = _playerIntID;
		_mainloop = false;
	} else
	{
		_mainloopcounter = _mainloopcounter + 1;
		if (_mainloopcounter > 10) exitWith
		{
			_mainloop = false;
			false;
		};
	};
};
if (_databaseResult isEqualTo [false]) exitWith {false;};
if (_mainloopcounter > 10) exitWith {false;};
_return;
