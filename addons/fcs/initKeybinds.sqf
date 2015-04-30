// by commy2

["ACE3 Vehicle", QGVAR(lazeTarget), localize "STR_ACE_FCS_LaseTarget",
{
    // Conditions: canInteract
    if !([ACE_player, vehicle ACE_player, []] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !((!GVAR(enabled) && FUNC(canUseFCS)) || FUNC(canUseRangefinder)) exitWith {false};

    if (GETGVAR(isDownStateKey1,false)) exitWith {false};
    GVAR(isDownStateKey1) = true;

    // Statement
    [vehicle ACE_player, [ACE_player] call EFUNC(common,getTurretIndex)] call FUNC(keyDown);
    // Return false so it doesn't block the rest weapon action
    false
},
{
    // prevent holding down
    GVAR(isDownStateKey1) = false;

    // Conditions: canInteract
    if !([ACE_player, vehicle ACE_player, []] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !(GVAR(enabled) && FUNC(canUseFCS)) exitWith {false};

    // Statement
    [vehicle ACE_player, [ACE_player] call EFUNC(common,getTurretIndex)] call FUNC(keyUp);
    false
},
[15, [false, false, false]], false] call cba_fnc_addKeybind;  //Tab Key

["ACE3 Vehicle", QGVAR(adjustRangeUp), localize "STR_ACE_FCS_AdjustRangeUp",
{
    // Conditions: canInteract
    if !([ACE_player, vehicle ACE_player, []] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !(call FUNC(canUseFCS)) exitWith {false};

    // Statement
    [vehicle ACE_player, [ACE_player] call EFUNC(common,getTurretIndex), 50] call FUNC(adjustRange);
    true
},
{false},
[201, [false, false, false]], false] call cba_fnc_addKeybind;  //PageUp Key

["ACE3 Vehicle", QGVAR(adjustRangDown), localize "STR_ACE_FCS_AdjustRangeDown",
{
    // Conditions: canInteract
    if !([ACE_player, vehicle ACE_player, []] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !(call FUNC(canUseFCS)) exitWith {false};

    // Statement
    [vehicle ACE_player, [ACE_player] call EFUNC(common,getTurretIndex), -50] call FUNC(adjustRange);
    true
},
{false},
[209, [false, false, false]], false] call cba_fnc_addKeybind; //PageDown Key
