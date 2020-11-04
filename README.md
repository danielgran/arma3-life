# DUCKLIFE



Represents the Serverside structure



You need life.sql file to add to a database (was generated with navicat)



The Redis implementation can be found here: https://github.com/Duckfine/ArmA3.Extension.Redis



Redis was implemented to store the complete cache of an player / entity / object to the local gameserver to reduce lag to an external (other host) MySQL Server.


The structure is finished. All ingame related things (such as dealers, mapping, is not finished)



The project has its own way to communicate between server and players. The player is only permitted to communicate with the server not with other players via remoteExec.
The Server has its own implementation to handle different kinds of requests. Found in A3Master\@DUCK.Core\addons\duck.core\core\system


Requests from the client are made to A3Master\@DUCK.Core\addons\duck.core\core\system\network\fn_serverInterface.sqf from there everything goes to its specific module



A player can not execute any script or request as an other player (remoteExec allows this). A Token is shared between player and servercache to prevent this. in every request this token is checked. Every request fails when the sent token is incorrect.
Due to the lack of an CfgRemoteExec this system isn't finished. I haven't made it yet.



The tazer works. Its an example of implementing an inamge-feature. (A3Master\mpmissions\LIFE.Altis\life\player\actions\fn_taze.sqf)



I see this as an high-security completly custom gamemode. Its not finished. Feel free to fork this, make pull requests etc. But please mention my Name anywhere its seen.

