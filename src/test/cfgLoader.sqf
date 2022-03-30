private _normalize_string = {
    params["_text"];
    (_text splitString '"') select 0
};

private _cfgFunctions = configFile >> "CfgFunctions";
private _preStart = [];
private _preInit = [];
private _postInit = [];
for "_mainFunc" from 0 to (count _cfgFunctions)-1 do
{
    private _mainConfigCfg = _cfgFunctions select _mainFunc;
    private _mainConfigName = configName _mainConfigCfg;
    private _mainConfigTag = getText (_mainConfigCfg >> "tag") call _normalize_string;

    diag_log format["Processing Mainconfig: %1 with tag %2", _mainConfigName,
         _mainConfigTag];
    for "_subModuleCfg" from 0 to (count _mainConfigCfg)-1 do
    {
        private _subCfg = _mainConfigCfg select _subModuleCfg;
        if (configName _subCfg != "tag") then {
            for "_functionClass" from 0 to ((count _subCfg)-1) do
            {
                private _functionCfg = _subCfg select _functionClass;
                if (configName _functionCfg != "file") then 
                {
                    private _functionName = (configName _functionCfg) call _normalize_string;
                    private _filePath = getText (_subCfg >> "file") call _normalize_string;
                    diag_log format[" --> Processing submodule: %1 at %2", configName _subCfg, _filePath];
                    _filePath = format ["%1/fn_%2.sqf", _filePath, _functionName];
                    private _content = preprocessFile _filePath;
                    diag_log format["   --> Processing function: %1", _functionName];
                    diag_log format["         at: %1", _filePath];
                    private _bin = compile _content;
                    private _namespaceName = format ["%1_fnc_%2", _mainConfigTag, _functionName];
                    diag_log format["         finished: %1", _namespaceName];
                    missionNamespace setVariable [
                        _namespaceName,
                        _bin
                    ];
                };
            };
        };
    };
};

"END POST INIT" call test_fnc_log;