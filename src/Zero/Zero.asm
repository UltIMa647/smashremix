// J Falcon.asm

// This file contains file inclusions, action edits, and assembly for J Captain Falcon.

scope Zero {
    // Insert Moveset files

    // Modify Action Parameters             // Action               // Animation                // Moveset Data             // Flags
    Character.edit_action_parameters(ZERO, Action.Entry,                  File.ZERO_IDLE,                  -1,                       -1)
    Character.edit_action_parameters(ZERO, 0x006,                         File.ZERO_IDLE,                  -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.Revive2,                File.ZERO_DOWNSTANDD,            -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.ReviveWait,             File.ZERO_IDLE,                  -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.Idle,                   File.ZERO_IDLE,                  -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.Walk1,                  File.ZERO_WALK1,                 -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.Walk2,                  File.ZERO_WALK2,                 -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.Walk3,                  File.ZERO_WALK3,                 -1,                       -1)
    Character.edit_action_parameters(ZERO, 0x00E,                         File.ZERO_WALKEND,               -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.Dash,                   File.ZERO_DASH,                  -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.Run,                    File.ZERO_RUN,                   -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.RunBrake,               File.ZERO_RUNBRAKE,              -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.Turn,                   File.ZERO_TURN,                  -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.TurnRun,                File.ZERO_TURNRUN,               -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.JumpSquat,              File.ZERO_LANDING,               -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.ShieldJumpSquat,        File.ZERO_LANDING,               -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.JumpF,                  File.ZERO_JUMPF,                 -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.JumpB,                  File.ZERO_JUMPB,                 -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.JumpAerialF,            File.ZERO_JUMPAERIALF,           -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.JumpAerialB,            File.ZERO_JUMPAERIALB,           -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.Fall,                   File.ZERO_FALL,                  -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.FallAerial,             File.ZERO_FALLAERIAL,            -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.Crouch,                 File.ZERO_CROUCH,                -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.CrouchIdle,             File.ZERO_CROUCHIDLE,            -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.CrouchEnd,              File.ZERO_CROUCHEND,             -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.LandingLight,           File.ZERO_LANDING,               -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.LandingHeavy,           File.ZERO_LANDING,               -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.Pass,                   File.ZERO_PLATDROP,              -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.ShieldDrop,             File.ZERO_PLATDROP,              -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.Teeter,                 File.ZERO_TEETER,                -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.TeeterStart,            File.ZERO_TEETERSTART,           -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.FallSpecial,            File.ZERO_FALLSPECIAL,           -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.LandingSpecial,         File.ZERO_LANDING,               -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.Tornado,                File.ZERO_TUMBLE,                -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.EnterPipe,              File.ZERO_ENTERPIPE,             -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.ExitPipe,               File.ZERO_EXITPIPE,              -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.ExitPipeWalk,           File.ZERO_EXITPIPEWALK,          -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.CeilingBonk,            File.ZERO_CEILINGBONK,           -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.DownStandD,             File.ZERO_DOWNSTANDD,            -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.DownStandU,             File.ZERO_DOWNSTANDU,            -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.TechF,                  File.ZERO_TECHF,                 -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.TechB,                  File.ZERO_TECHB,                 -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.DownForwardD,           File.ZERO_DOWNFORWARDD,          -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.DownForwardU,           File.ZERO_DOWNFORWARDU,          -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.DownBackD,              File.ZERO_DOWNBACKD,             -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.DownBackU,              File.ZERO_DOWNBACKU,             -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.DownAttackD,            File.ZERO_DOWNATTACKD,           -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.DownAttackU,            File.ZERO_DOWNATTACKU,           -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.Tech,                   File.ZERO_TECH,                  -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.ClangRecoil,            File.ZERO_CLANGRECOIL,           -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.CliffClimbQuick2,       File.ZERO_CLIFFCLIMBQUICK2,      -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.CliffClimbSlow2,        File.ZERO_CLIFFCLIMBSLOW2,       -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.CliffAttackQuick2,      File.ZERO_CLIFFATTACKQUICK2,     -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.CliffAttackSlow2,       File.ZERO_CLIFFATTACKSLOW2,      -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.CliffEscapeQuick2,      File.ZERO_CLIFFESCAPEQUICK2,     -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.CliffEscapeSlow2,       File.ZERO_CLIFFESCAPESLOW2,      -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.LightItemPickup,        File.ZERO_LIGHTITEMPICKUP,       -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.HeavyItemPickup,        File.ZERO_HEAVYITEMPICKUP,       -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.ItemDrop,               File.ZERO_ITEMDROP,              -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.ItemThrowDash,          File.ZERO_ITEMTHROWDASH,         -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.ItemThrowF,             File.ZERO_ITEMTHROWF,            -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.ItemThrowB,             File.ZERO_ITEMTHROWF,            -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.ItemThrowU,             File.ZERO_ITEMTHROWU,            -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.ItemThrowD,             File.ZERO_ITEMTHROWD,            -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.ItemThrowSmashF,        File.ZERO_ITEMTHROWF,            -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.ItemThrowSmashB,        File.ZERO_ITEMTHROWF,            -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.ItemThrowSmashU,        File.ZERO_ITEMTHROWU,            -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.ItemThrowSmashD,        File.ZERO_ITEMTHROWD,            -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.ItemThrowAirF,          File.ZERO_ITEMTHROWAIRF,         -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.ItemThrowAirB,          File.ZERO_ITEMTHROWAIRF,         -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.ItemThrowAirU,          File.ZERO_ITEMTHROWAIRU,         -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.ItemThrowAirD,          File.ZERO_ITEMTHROWAIRD,         -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.ItemThrowAirSmashF,     File.ZERO_ITEMTHROWAIRF,         -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.ItemThrowAirSmashB,     File.ZERO_ITEMTHROWAIRF,         -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.ItemThrowAirSmashU,     File.ZERO_ITEMTHROWAIRU,         -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.ItemThrowAirSmashD,     File.ZERO_ITEMTHROWAIRD,         -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.HeavyItemThrowF,        File.ZERO_HEAVYITEMTHROW,        -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.HeavyItemThrowB,        File.ZERO_HEAVYITEMTHROW,        -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.HeavyItemThrowSmashF,   File.ZERO_HEAVYITEMTHROW,        -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.HeavyItemThrowSmashB,   File.ZERO_HEAVYITEMTHROW,        -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.BeamSwordNeutral,       File.ZERO_ITEMNEUTRAL,           -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.BeamSwordTilt,          File.ZERO_ITEMTILT,              -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.BeamSwordSmash,         File.ZERO_ITEMSMASH,             -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.BeamSwordDash,          File.ZERO_ITEMDASH,              -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.BatNeutral,             File.ZERO_ITEMNEUTRAL,           -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.BatTilt,                File.ZERO_ITEMTILT,              -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.BatSmash,               File.ZERO_ITEMSMASH,             -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.BatDash,                File.ZERO_ITEMDASH,              -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.FanNeutral,             File.ZERO_ITEMNEUTRAL,           -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.FanTilt,                File.ZERO_ITEMTILT,              -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.FanSmash,               File.ZERO_ITEMSMASH,             -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.FanDash,                File.ZERO_ITEMDASH,              -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.StarRodNeutral,         File.ZERO_ITEMNEUTRAL,           -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.StarRodTilt,            File.ZERO_ITEMTILT,              -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.StarRodSmash,           File.ZERO_ITEMSMASH,             -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.StarRodDash,            File.ZERO_ITEMDASH,              -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.RayGunShoot,            File.ZERO_ITEMSHOOT,             -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.RayGunShootAir,         File.ZERO_ITEMSHOOTAIR,          -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.FireFlowerShoot,        File.ZERO_ITEMSHOOT,             -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.FireFlowerShootAir,     File.ZERO_ITEMSHOOTAIR,          -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.HammerIdle,             File.ZERO_HAMMERIDLE,            -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.HammerWalk,             File.ZERO_HAMMERMOVE,            -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.HammerTurn,             File.ZERO_HAMMERMOVE,            -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.HammerJumpSquat,        File.ZERO_HAMMERMOVE,            -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.HammerAir,              File.ZERO_HAMMERMOVE,            -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.HammerLanding,          File.ZERO_HAMMERMOVE,            -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.ShieldOn,               File.ZERO_SHIELDON,              -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.ShieldOff,              File.ZERO_SHIELDOFF,             -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.RollF,                  File.ZERO_ROLLF,                 -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.RollB,                  File.ZERO_ROLLB,                 -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.StunStartD,             File.ZERO_DOWNSTANDD,            -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.StunStartU,             File.ZERO_DOWNSTANDU,            -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.Stun,                   File.ZERO_STUN,                  -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.Sleep,                  File.ZERO_STUN,                  -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.Grab,                   File.ZERO_GRAB,                  -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.GrabPull,               File.ZERO_GRABPULL,              -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.ThrowF,                 File.ZERO_THROWF,                -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.ThrowB,                 File.ZERO_THROWB,                -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.CapturePulled,          File.ZERO_CAPTUREPULLED,         -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.EggLayPulled,           File.ZERO_CAPTUREPULLED,         -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.EggLay,                 File.ZERO_IDLE,                  -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.Taunt,                  File.ZERO_TAUNT,                 -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.Jab1,                   File.ZERO_JAB1,                  -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.Jab2,                   File.ZERO_JAB2,                  -1,                       -1)
    Character.edit_action_parameters(ZERO, 0xDC,                          File.ZERO_ACTION_0DC,            -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.DashAttack,             File.ZERO_DASHATTACK,            -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.FTiltHigh,              File.ZERO_FTILT,                 -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.FTiltMidHigh,           0,                              0x80000000,               0)
    Character.edit_action_parameters(ZERO, Action.FTilt,                  File.ZERO_FTILT,                 -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.FTiltMidLow,            0,                              0x80000000,               0)
    Character.edit_action_parameters(ZERO, Action.FTiltLow,               File.ZERO_FTILT,                 -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.UTilt,                  File.ZERO_UTILT,                 -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.DTilt,                  File.ZERO_DTILT,                 -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.FSmashHigh,             File.ZERO_FSMASH,                -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.FSmash,                 File.ZERO_FSMASH,                -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.FSmashLow,              File.ZERO_FSMASH,                -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.USmash,                 File.ZERO_USMASH,                -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.DSmash,                 File.ZERO_DSMASH,                -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.AttackAirN,             File.ZERO_ATTACKAIRN,            -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.AttackAirF,             File.ZERO_ATTACKAIRF,            -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.AttackAirB,             File.ZERO_ATTACKAIRB,            -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.AttackAirU,             File.ZERO_ATTACKAIRU,            -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.AttackAirD,             File.ZERO_ATTACKAIRD,            -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.LandingAirF,            File.ZERO_LANDINGAIRF,           -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.LandingAirB,            File.ZERO_LANDINGAIRB,           -1,                       -1)
    Character.edit_action_parameters(ZERO, Action.LandingAirX,            File.ZERO_LANDING,               -1,                       -1)

    // Modify Menu Action Parameters             // Action          // Animation                // Moveset Data             // Flags
    Character.edit_menu_action_parameters(ZERO,   0x0,               File.ZERO_IDLE,              -1,                         -1)          // CSS Idle
    Character.edit_menu_action_parameters(ZERO,   0x1,               File.ZERO_VICTORY_1,         -1,                         -1)          // Victory1
    Character.edit_menu_action_parameters(ZERO,   0x2,               File.ZERO_VICTORY_2,         -1,                         -1)          // Victory2
    Character.edit_menu_action_parameters(ZERO,   0x3,               File.ZERO_VICTORY_3,         -1,                         -1)          // Victory3
    Character.edit_menu_action_parameters(ZERO,   0x4,               File.ZERO_VICTORY_1,         -1,                         -1)          // CSS Select
    Character.edit_menu_action_parameters(ZERO,   0xD,               File.ZERO_1P_POSE,           -1,                         -1)          // Classic Mode Pose
    Character.edit_menu_action_parameters(ZERO,   0x5,               File.ZERO_CLAP,              -1,                         -1)
    Character.edit_menu_action_parameters(ZERO,   0x9,               File.ZERO_CONTINUEFALL,      -1,                         -1)
    Character.edit_menu_action_parameters(ZERO,   0xA,               File.ZERO_CONTINUEUP,        -1,                         -1)

    // Set default costumes
    //Character.set_default_costumes(Character.id.ZERO, 0, 1, 2, 3, 4, 5, 6)

    // Shield colors for costume matching
    Character.set_costume_shield_colors(ZERO, RED, BLACK, BLUE, GREEN, PURPLE, ORANGE, YELLOW, PINK)

        // Remove entry script (no Blue Falcon).
    Character.table_patch_start(entry_script, Character.id.ZERO, 0x4)
    dw 0x8013DD68                           // skips entry script
    OS.patch_end()

    // Set crowd chant FGM.
     Character.table_patch_start(crowd_chant_fgm, Character.id.ZERO, 0x2)
     dh  0x031E
     OS.patch_end()

    // Set action strings
    Character.table_patch_start(action_string, Character.id.ZERO, 0x4)
    dw  Action.CAPTAIN.action_string_table
    OS.patch_end()

    Character.table_patch_start(rapid_jab, Character.id.ZERO, 0x4)
    dw      Character.rapid_jab.DISABLED        // disable rapid jab
    OS.patch_end()

}