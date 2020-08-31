/*

  Author: Duckfine
  Date created: 31-8-2020 17:10

  Description
    <desc>

  Parameter:
    params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];

  Returns:
   If code provided returns a numeric value, this value will overwrite the default damage of given selection after processing. Return value of 0 will make the unit invulnerable if damage is not scripted in other ways (i.e using setDamage and/or setHit for additional damage handling). If no value is returned, the default damage processing will be done. This allows for safe stacking of this event handler. Only the return value of the last added "HandleDamage" EH is considered.


 */




private[

  "_placeholder01",
  "_placeholder02"

];


params[

  ["_unit", objNull, [objNull]], //  Object - Object the event handler is assigned to.
  ["_selection", "", ["a"]], // selection: String - Name of the selection where the unit was damaged."" for over-all structural damage "?" for unknown selections
  ["_damage", 0, [1]], // Resulting level of damage for the selection.
  ["_source", objNull, [objNull]], // Damager
  ["_projectile", "", ["a"]], // Classname of the projectile that caused inflicted the damage. ("" for unknown, such as falling damage.)
  ["_hitPartIndex", -1, [1]], // Hit part index of the hit point, -1 otherwise.
  ["_instigator", objNull, [objNull]], // Person who pulled the trigger
  ["_hitPoint", "", ["a"]] // hit point Cfg name
];

hint "hsn";

if (!(isPlayer _unit) || !(isPlayer _source)) exitWith {};
hint str(_unit);

systemChat format ["%1", currentWeapon _source ];
systemChat format ["%1", _projectile ];


// Tazer
if ((_source != _unit) && (alive _unit)) then
{
  if(currentWeapon _source isEqualTo "hgun_ACPC2_F" && _projectile isEqualTo "B_45ACP_Ball_Green") then
  {
hint "hsn2";

	_distance = (getPos _source) distance (getPos _unit);
	if(_distance > 10) exitWith { false; };
	// set _unit tazed
hint "hsn3";

	[_source, _unit] spawn CDUC_ACT_fnc_taze;
	0;
  };
};







