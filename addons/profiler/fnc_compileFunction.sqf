#include "script_component.hpp"
params ["_sqfFile","_name","_isReturning",["_isHighFreq",false]];
private _fnc = [compileScript [_sqfFile, true], _name, _isReturning, _isHighFreq] call FUNCMAIN(instrumentFunction);
missionNamespace setVariable [_name, _fnc];
_fnc 