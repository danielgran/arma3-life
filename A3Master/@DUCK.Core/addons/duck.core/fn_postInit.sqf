diag_log "_____  _    _  _____ _  __  _____ ____  _____  ______   ";
diag_log "|  __ \| |  | |/ ____| |/ / / ____/ __ \|  __ \|  ____| ";
diag_log "| |  | | |  | | |    | ' / | |   | |  | | |__) | |__    ";
diag_log "| |  | | |  | | |    |  <  | |   | |  | |  _  /|  __|   ";
diag_log "| |__| | |__| | |____| . \ | |___| |__| | | \ \| |____  ";
diag_log "|_____/ \____/ \_____|_|\_(_)_____\____/|_|__\_\______| ";
diag_log "                                                        ";
diag_log "|  __ \ / __ \ / ____|__   __|_   _| \ | |_   _|__   __|";
diag_log "| |__) | |  | | (___    | |    | | |  \| | | |    | |   ";
diag_log "|  ___/| |  | |\___ \   | |    | | | . ` | | |    | |   ";
diag_log "| |    | |__| |____) |  | |   _| |_| |\  |_| |_   | |   ";
diag_log "|_|     \____/|_____/   |_|  |_____|_| \_|_____|  |_|   ";

// Set Servers in cache
[] spawn DUC_CORE_SYS_FNC_getServerInfo;

"END POST INIT" call test_fnc_log;