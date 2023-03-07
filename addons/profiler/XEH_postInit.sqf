#include "script_component.hpp"
INFO("Profiler");
[{
	INFO("Data");
	call FUNCMAIN(highFreqReport);
	call FUNCMAIN(report);
}, 30] call CBA_fnc_addPerFrameHandler;
