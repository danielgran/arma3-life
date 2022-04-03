#include "duck.core/test/common_cba_defines.hpp"

_fn = "DUC_core_fnc_generateID";

private _param = "X000X0";
_result = [_param] call DUC_core_fnc_generateID;
_expected = count _param;

TEST_OP(_result,==,_expected,"fus");
