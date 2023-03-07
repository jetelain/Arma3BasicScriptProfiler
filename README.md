# Basic SQF Profile

This is a really basic profiler intend to measure functions elapsed time.

## Setup

Profiler needs to instrument methods, it's designed to instrument methods using `PREP` / `PREPMAIN` from CBA.

You need to add the following declaration in the file `addons\main\script_macros.hpp`.

For a CBA style mod (.sqf files in the addon directory) :
```
#ifdef PROFILER
    #define PREP_RET(fncName)         [QPATHTOF(DOUBLES(fnc,fncName).sqf),QFUNC(fncName),true,false] call bsp_fnc_compileFunction
    #define PREP_VOID(fncName)        [QPATHTOF(DOUBLES(fnc,fncName).sqf),QFUNC(fncName),false,false] call bsp_fnc_compileFunction
    #define PREP_RET_HF(fncName)      [QPATHTOF(DOUBLES(fnc,fncName).sqf),QFUNC(fncName),true,true] call bsp_fnc_compileFunction
    #define PREP_VOID_HF(fncName)     [QPATHTOF(DOUBLES(fnc,fncName).sqf),QFUNC(fncName),false,true] call bsp_fnc_compileFunction
    #define PREPMAIN_RET(fncName)     [QPATHTOF(DOUBLES(fnc,fncName).sqf),QFUNCMAIN(fncName),true,false] call bsp_fnc_compileFunction
    #define PREPMAIN_VOID(fncName)    [QPATHTOF(DOUBLES(fnc,fncName).sqf),QFUNCMAIN(fncName),false,false] call bsp_fnc_compileFunction
    #define PREPMAIN_RET_HF(fncName)  [QPATHTOF(DOUBLES(fnc,fncName).sqf),QFUNCMAIN(fncName),true,true] call bsp_fnc_compileFunction
    #define PREPMAIN_VOID_HF(fncName) [QPATHTOF(DOUBLES(fnc,fncName).sqf),QFUNCMAIN(fncName),false,true] call bsp_fnc_compileFunction
#else
    #define PREP_RET(fncName)         PREP(fncName)
    #define PREP_VOID(fncName)        PREP(fncName)
    #define PREP_RET_HF(fncName)      PREP(fncName)
    #define PREP_VOID_HF(fncName)     PREP(fncName)
    #define PREPMAIN_RET(fncName)     PREPMAIN(fncName)
    #define PREPMAIN_VOID(fncName)    PREPMAIN(fncName)
    #define PREPMAIN_RET_HF(fncName)  PREPMAIN(fncName)
    #define PREPMAIN_VOID_HF(fncName) PREPMAIN(fncName)
#endif
```

For an ACE style mod (.sqf files in the functions sub-directory) :
```
#ifdef PROFILER
    #define PREP_RET(fncName)         [QPATHTOF(functions\DOUBLES(fnc,fncName).sqf),QFUNC(fncName),true,false] call bsp_fnc_compileFunction
    #define PREP_VOID(fncName)        [QPATHTOF(functions\DOUBLES(fnc,fncName).sqf),QFUNC(fncName),false,false] call bsp_fnc_compileFunction
    #define PREP_RET_HF(fncName)      [QPATHTOF(functions\DOUBLES(fnc,fncName).sqf),QFUNC(fncName),true,true] call bsp_fnc_compileFunction
    #define PREP_VOID_HF(fncName)     [QPATHTOF(functions\DOUBLES(fnc,fncName).sqf),QFUNC(fncName),false,true] call bsp_fnc_compileFunction
    #define PREPMAIN_RET(fncName)     [QPATHTOF(functions\DOUBLES(fnc,fncName).sqf),QFUNCMAIN(fncName),true,false] call bsp_fnc_compileFunction
    #define PREPMAIN_VOID(fncName)    [QPATHTOF(functions\DOUBLES(fnc,fncName).sqf),QFUNCMAIN(fncName),false,false] call bsp_fnc_compileFunction
    #define PREPMAIN_RET_HF(fncName)  [QPATHTOF(functions\DOUBLES(fnc,fncName).sqf),QFUNCMAIN(fncName),true,true] call bsp_fnc_compileFunction
    #define PREPMAIN_VOID_HF(fncName) [QPATHTOF(functions\DOUBLES(fnc,fncName).sqf),QFUNCMAIN(fncName),false,true] call bsp_fnc_compileFunction
#else
    #define PREP_RET(fncName)         PREP(fncName)
    #define PREP_VOID(fncName)        PREP(fncName)
    #define PREP_RET_HF(fncName)      PREP(fncName)
    #define PREP_VOID_HF(fncName)     PREP(fncName)
    #define PREPMAIN_RET(fncName)     PREPMAIN(fncName)
    #define PREPMAIN_VOID(fncName)    PREPMAIN(fncName)
    #define PREPMAIN_RET_HF(fncName)  PREPMAIN(fncName)
    #define PREPMAIN_VOID_HF(fncName) PREPMAIN(fncName)
#endif
```

Then, in the `addons\*\XEH_PREP.hpp` files, 
 - replace `PREP` by
   - `PREP_RET` if the function returns a value
   - `PREP_VOID` if the function returns nothing
   - `PREP_RET_HF` if the function returns a value and is Per Frame Handler
   - `PREP_VOID_HF` if the function returns nothing and is Per Frame Handler
 - replace `PREPMAIN` by
   - `PREPMAIN_RET` if the function returns a value
   - `PREPMAIN_VOID` if the function returns nothing
   - `PREPMAIN_RET_HF` if the function returns a value and is Per Frame Handler
   - `PREPMAIN_VOID_HF` if the function returns nothing and is Per Frame Handler
