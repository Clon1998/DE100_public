Group_LB_Refresh =
    {
        //------REFRESH THE SQUAD LIST BOXES WITH UPDATED NAMES------//
        lbClear 6100;
        if (!isnil "Alpha") then {
            _listgroupsunitsA = units Alpha;
            _groupSizeA = count(_listgroupsunitsA);
            _grouptotalA = _groupSizeA - 1;
            _shortGroupNameA = [];
            {
                _fixnamesA = text(_x call life_fnc_name);
                _shortGroupNameA set[count _shortGroupNameA, _fixnamesA];
            }
            forEach _listgroupsunitsA;
            for "_i"
            from 0 to _grouptotalA do {
                _index = lbAdd[6100, str(_shortGroupNameA select _i)];
            };
        };
        lbClear 6101;
        if (!isnil "Bravo") then {
            _listgroupsunitsB = units Bravo;
            _groupSizeB = count(_listgroupsunitsB);
            _grouptotalB = _groupSizeB - 1;
            _shortGroupNameB = [];
            {
                _fixnamesB = text(_x call life_fnc_name);
                _shortGroupNameB set[count _shortGroupNameB, _fixnamesB];
            }
            forEach _listgroupsunitsB;
            for "_i"
            from 0 to _grouptotalB Do {
                _index = lbAdd[6101, str(_shortGroupNameB select _i)];
            };
        };
        lbClear 6102;
        if (!isnil "Charlie") then {
            _listgroupsunitsC = units Charlie;
            _groupSizeC = count(_listgroupsunitsC);
            _grouptotalC = _groupSizeC - 1;
            _shortGroupNameC = [];
            {
                _fixnamesC = text(_x call life_fnc_name);
                _shortGroupNameC set[count _shortGroupNameC, _fixnamesC];
            }
            forEach _listgroupsunitsC;
            for "_i"
            from 0 to _grouptotalC do {
                _index = lbAdd[6102, str(_shortGroupNameC select _i)];
            };
        };
        lbClear 6103;
        if (!isnil "Delta") then {
            _listgroupsunitsD = units Delta;
            _groupSizeD = count(_listgroupsunitsD);
            _grouptotalD = _groupSizeD - 1;
            _shortGroupNameD = [];
            {
                _fixnamesD = text(_x call life_fnc_name);
                _shortGroupNameD set[count _shortGroupNameD, _fixnamesD];
            }
            forEach _listgroupsunitsD;
            for "_i"
            from 0 to _grouptotalD Do {
                _index = lbAdd[6103, str(_shortGroupNameD select _i)];
            };
        };
    };
//---------------------------------------------------------------------------------------------------------------------Join Alpha-------------------------------------------------------------------------------------------------------//
GrpAlpha =
    {
        If(!Local Player) ExitWith {};
        If(Isnil "Alpha") Then
        {
            Alpha = CreateGroup West;
            [Player] Join GrpNull;
            [Player] JoinSilent Alpha;
            PublicVariable "Alpha";
            HintSilent "You've created group Alpha as the leader";
        }
        Else //!isnil alpha
        {
            If(Group Player == Alpha) Then
            {
                HintSilent "You are already in group Alpha";
            }
            Else
            {
                If(Count Units Alpha == 0) Then
                {
                    deleteGroup Alpha;
                    Alpha = Nil;
                    Alpha = CreateGroup West;
                    HintSilent "You've created group Alpha as the leader";
                    publicvariable "Alpha";
                };
                [Player] Join GrpNull;
                [Player] JoinSilent Alpha;
                If(Count Units Alpha > 1) Then
                {
                    HintSilent "You've joined group Alpha";
                    {
                        If(RankId Player > RankId _x) Then
                        {
                            Alpha selectLeader Player;
                        }
                    }
                    ForEach Units Alpha;
                    PublicVariable "Alpha";
                };
            };
        };
        WaitUntil {
            Group Player == Alpha
        };
        [] Spawn Group_LB_Refresh;
        //                                   
    };
//--------------------------------------------------------------------------------------------------------------------------Join Bravo--------------------------------------------------------------------------------------------------//
GrpBravo =
    {
        If(!Local Player) ExitWith {};
        If(IsNil "Bravo") Then
        {
            Bravo = CreateGroup West;
            [Player] Join GrpNull;
            [Player] JoinSilent Bravo;
            PublicVariable "Bravo";
            HintSilent "You've created group Bravo as the leader";
        }
        Else
        {
            If(Group Player == Bravo) Then
            {
                HintSilent "You are already in group Bravo";
            }
            Else
            {
                If(Count Units Bravo == 0) Then
                {
                    deleteGroup Bravo;
                    Bravo = Nil;
                    Bravo = CreateGroup West;
                    HintSilent "You've created group Bravo as the leader";
                    publicvariable "Bravo";
                };
                [Player] Join GrpNull;
                [Player] JoinSilent Bravo;
                If(Count Units Bravo > 1) Then
                {
                    HintSilent "You've joined group Bravo";
                    {
                        If(RankId Player > RankId _x) Then
                        {
                            Bravo selectLeader Player;
                        }
                    }
                    ForEach Units Bravo;
                    PublicVariable "Bravo";
                };
            };
        };
        WaitUntil {
            Group Player == Bravo
        };
        [] Spawn Group_LB_Refresh;
    };
//-----------------------------------------------------------------------------------------------------------------------Join Charlie-------------------------------------------------------------------------------------------------//
GrpCharlie =
    {
        If(!Local Player) ExitWith {};
        If(IsNil "Charlie") Then
        {
            Charlie = CreateGroup West;
            [Player] Join GrpNull;
            [Player] JoinSilent Charlie;
            PublicVariable "Charlie";
            HintSilent "You've created group Charlie as the leader";
        }
        Else
        {
            If(Group Player == Charlie) Then
            {
                HintSilent "You are already in group Charlie";
            }
            Else
            {
                If(Count Units Charlie == 0) Then
                {
                    deleteGroup Charlie;
                    Charlie = Nil;
                    Charlie = CreateGroup West;
                    HintSilent "You've created group Charlie as the leader";
                    publicvariable "Charlie";
                };
                [Player] JoinSilent GrpNull;
                [Player] JoinSilent Charlie;
                If(Count Units Charlie > 1) Then
                {
                    HintSilent "You've joined group Charlie";
                    {
                        If(RankId Player > RankId _x) Then
                        {
                            Charlie selectLeader Player;
                        }
                    }
                    ForEach Units Charlie;
                    PublicVariable "Charlie";
                };
            };
        };
        WaitUntil {
            Group Player == Charlie
        };
        [] Spawn Group_LB_Refresh;
    };
//----------------------------------------------------------------------------------------------------------------------------Join Delta------------------------------------------------------------------------------------------------//
GrpDelta =
    {
        If(!Local Player) ExitWith {};
        If(IsNil "Delta") Then
        {
            Delta = CreateGroup West;
            [Player] Join GrpNull;
            [Player] JoinSilent Delta;
            PublicVariable "Delta";
            HintSilent "You've Created group Delta, as the Leader";
        }
        Else
        {
            If(Group Player == Delta) Then
            {
                HintSilent "You are already in group Delta";
            }
            Else
            {
                If(Count Units Delta == 0) Then
                {
                    deleteGroup Delta;
                    Delta = Nil;
                    Delta = CreateGroup West;
                    HintSilent "You've created group Delta as the leader";
                    publicvariable "Delta";
                };
                [Player] Join GrpNull;
                [Player] JoinSilent Delta;
                If(Count Units Delta > 1) Then
                {
                    HintSilent "You've joined group Delta";
                    {
                        If(RankId Player > RankId _x) Then
                        {
                            Delta selectLeader Player;
                        }
                    }
                    ForEach Units Delta;
                    PublicVariable "Delta";
                };
            };
        };WaitUntil {
            Group Player == Delta
        };
        [] Spawn Group_LB_Refresh;
    };
GrpLoneWolf =
    {
        If(!Local Player) ExitWith {};
        [Player] Join GrpNull;
        HintSilent "You're going lonewolf !!";
        PublicVariable "Alpha";
        PublicVariable "Bravo";
        PublicVariable "Charlie";
        PublicVariable "Delta";
        //WaitUntil {Group Player == GrpNull};
        [] Spawn Group_LB_Refresh;
    };