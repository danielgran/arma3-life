/*
  Postinit from LIFE Extension


  Author: Duckfine
*/
diag_log "    ___          _     _    _  __        ";
diag_log "   |   \ _  _ __| |__ | |  (_)/ _|___    ";
diag_log "   | |) | || / _| / /_| |__| |  _/ -_)   ";
diag_log "  _|___/_\_,_\__|_\_(_)____|_|_|_\___|__ ";
diag_log " | _ \/ _ \/ __|_   _|_ _| \| |_ _|_   _|";
diag_log " |  _/ (_) \__ \ | |  | || .` || |  | |  ";
diag_log " |_|  \___/|___/ |_| |___|_|\_|___| |_|  ";


//Register Eventhandlers

// Player (Dis)connects
[] execVM "duck.life\life\events\ev_playerConnect.sqf";
[] execVM "duck.life\life\events\ev_playerDisconnect.sqf";




























//
