/*
  Preinit of life extension


*/

// Activate DEBUG Mode
#define DEBUG debug




diag_log "___  _   _  ___ _  __  _    ___ ___ ___   ";
diag_log "|   \| | | |/ __| |/ / | |  |_ _| __| __| ";
diag_log "| |) | |_| | (__| ' < _| |__ | || _|| _|  ";
diag_log "|___/_\___/_\___|_|\_(_)____|___|_| |___| ";
diag_log "   | _ \ _ \ __|_ _| \| |_ _|_   _|       ";
diag_log "   |  _/   / _| | || .` || |  | |         ";
diag_log "   |_| |_|_\___|___|_|\_|___| |_|         ";







_a3rversion = call DUC_core_redis_fnc_checkVersion;

diag_log format["[DUCK:LIFE] REDIS VERSION: %1", _a3rversion];





















//
