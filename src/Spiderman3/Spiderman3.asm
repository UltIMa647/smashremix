// Spiderman3.asm

// This file contains file inclusions, action edits, and assembly for Spider-Man UMvC3.

scope Spiderman3 {
    // Insert Moveset files
    insert VICTORY_1, "moveset/VICTORY_1.bin"
    insert VICTORY_2, "moveset/VICTORY_2.bin"
    insert VICTORY_3, "moveset/VICTORY_3.bin"
    insert ENTRY_1, "moveset/ENTRY_1.bin"
    GRAB:; Moveset.THROW_DATA(Spiderman.GRAB_RELEASE_DATA); insert "moveset/GRAB.bin"
    THROW_B:; Moveset.THROW_DATA(Spiderman.THROW_B_DATA); insert "moveset/THROW_B.bin"
    insert TAUNT, "moveset/TAUNT.bin"
    insert NSP_GROUND,"moveset/NSP_GROUND.bin"
    insert NSP_AIR,"moveset/NSP_AIR.bin"
    insert DSP, "moveset/DSP.bin"
    USP:; Moveset.THROW_DATA(Spiderman.USP_RELEASE_DATA); insert "moveset/USP.bin"

    scope Action {
        constant Jab3(0x0DC)
        constant JabLoopStart(0x0DD)
        constant JabLoop(0x0DE)
        constant JabLoopEnd(0x0DF)
        constant AppearLeft1(0x0E0)
        constant AppearRight1(0x0E1)
        constant AppearLeft2(0x0E2)
        constant AppearRight2(0x0E3)
        constant WebBall(0x0E4)
        constant WebBallAir(0x0E5)
        constant WebSwing(0x0E6)
        constant WebSwingCollide(0x0E7)
        //constant ?(0x0E8)
        constant WebSwingAir(0x0E9)
        //constant ?(0x0EA)
        //constant ?(0x0EB)
        //constant ?(0x0EC)
        //constant ?(0x0ED)
        //constant ?(0x0EE)
        constant WebGlide(0x0EF)
        constant WebGlideAir(0x0F0)
        constant WebGlideAirPull(0x0F1)
        constant WebGlideWallPull(0x0F2)
        constant UltimateWebThrow(0x0F3)
        constant WebGlideEnd(0x0F4)
        constant WebGlideGroundPull(0x0F5)
        constant WebGlideGroundThrow(0x0F6)

        // strings!
        string_0x0DC:; String.insert("Jab3")
        string_0x0DD:; String.insert("JabLoopStart")
        string_0x0DE:; String.insert("JabLoop")
        string_0x0DF:; String.insert("JabLoopEnd")
        string_0x0E0:; String.insert("AppearLeft1")
        string_0x0E1:; String.insert("AppearRight1")
        string_0x0E2:; String.insert("AppearLeft1")
        string_0x0E3:; String.insert("AppearRight2")
        string_0x0E4:; String.insert("WebBall")
        string_0x0E5:; String.insert("WebBallAir")
        string_0x0E6:; String.insert("WebSwing")
        string_0x0E7:; String.insert("WebSwingCollide")
        // string_0x0E8;: String.insert("?")
        string_0x0E9:; String.insert("WebSwingAir")
        // string_0x0EA;: String.insert("?")
        // string_0x0EB;: String.insert("?")
        // string_0x0EC;: String.insert("?")
        // string_0x0ED;: String.insert("?")
        // string_0x0EE;: String.insert("?")
        string_0x0EF:; String.insert("WebGlide")
        string_0x0F0:; String.insert("WebGlideAir")
        string_0x0F1:; String.insert("WebGlideAirPull")
        string_0x0F2:; String.insert("WebGlideWallPull")
        string_0x0F3:; String.insert("UltimateWebThrow")
        string_0x0F4:; String.insert("WebGlideEnd")
        string_0x0F5:; String.insert("WebGlideGroundPull")
        string_0x0F6:; String.insert("WebGlideGroundThrow")

        action_string_table:
        dw Action.COMMON.string_jab3
        dw string_0x0DD
        dw string_0x0DE
        dw string_0x0DF
        dw string_0x0E0
        dw string_0x0E1
        dw string_0x0E2
        dw string_0x0E3
        dw string_0x0E4
        dw string_0x0E5
        dw string_0x0E6
        dw string_0x0E7
        dw 0
        dw string_0x0E9
        dw 0
        dw 0
        dw 0
        dw 0
        dw 0
        dw string_0x0EF
        dw string_0x0F0
        dw string_0x0F1
        dw string_0x0F2
        dw string_0x0F3
        dw string_0x0F4
        dw string_0x0F5
        dw string_0x0F6
    }

    // Modify Action Parameters           // Action                      // Animation                    // Moveset Data           // Flags
    Character.edit_action_parameters(SP3, Action.Entry,                  File.SPM_IDLE,                  -1,                       -1)
    Character.edit_action_parameters(SP3, 0x006,                         File.SPM_IDLE,                  -1,                       -1)
    Character.edit_action_parameters(SP3, Action.Revive2,                File.SPM_DOWNSTANDD,            -1,                       -1)
    Character.edit_action_parameters(SP3, Action.ReviveWait,             File.SPM_IDLE,                  -1,                       -1)
    Character.edit_action_parameters(SP3, Action.Idle,                   File.SPM_IDLE,                  -1,                       -1)
    Character.edit_action_parameters(SP3, Action.Walk1,                  File.SPM_WALK1,                 -1,                       -1)
    Character.edit_action_parameters(SP3, Action.Walk2,                  File.SPM_WALK2,                 -1,                       -1)
    Character.edit_action_parameters(SP3, Action.Walk3,                  File.SPM_WALK3,                 -1,                       -1)
    Character.edit_action_parameters(SP3, 0x00E,                         File.SPM_WALKEND,               -1,                       -1)
    Character.edit_action_parameters(SP3, Action.Dash,                   File.SPM_DASH,                  -1,                       -1)
    Character.edit_action_parameters(SP3, Action.Run,                    File.SPM_RUN,                   -1,                       -1)
    Character.edit_action_parameters(SP3, Action.RunBrake,               File.SPM_RUNBRAKE,              -1,                       -1)
    Character.edit_action_parameters(SP3, Action.Turn,                   File.SPM_TURN,                  -1,                       -1)
    Character.edit_action_parameters(SP3, Action.TurnRun,                File.SPM_TURNRUN,               -1,                       -1)
    Character.edit_action_parameters(SP3, Action.JumpSquat,              File.SPM_LANDING,               -1,                       -1)
    Character.edit_action_parameters(SP3, Action.ShieldJumpSquat,        File.SPM_LANDING,               -1,                       -1)
    Character.edit_action_parameters(SP3, Action.JumpF,                  File.SPM_JUMPF,                 Spiderman.JUMP1,          -1)
    Character.edit_action_parameters(SP3, Action.JumpB,                  File.SPM_JUMPB,                 Spiderman.JUMP1,          -1)
    Character.edit_action_parameters(SP3, Action.JumpAerialF,            File.SPM_JUMPAERIALF,           Spiderman.JUMP2,          -1)
    Character.edit_action_parameters(SP3, Action.JumpAerialB,            File.SPM_JUMPAERIALB,           Spiderman.JUMP2,          -1)
    Character.edit_action_parameters(SP3, Action.Fall,                   File.SPM_FALL,                  -1,                       -1)
    Character.edit_action_parameters(SP3, Action.FallAerial,             File.SPM_FALLAERIAL,            -1,                       -1)
    Character.edit_action_parameters(SP3, Action.Crouch,                 File.SPM_CROUCH,                -1,                       -1)
    Character.edit_action_parameters(SP3, Action.CrouchIdle,             File.SPM_CROUCHIDLE,            -1,                       -1)
    Character.edit_action_parameters(SP3, Action.CrouchEnd,              File.SPM_CROUCHEND,             -1,                       -1)
    Character.edit_action_parameters(SP3, Action.LandingLight,           File.SPM_LANDING,               -1,                       -1)
    Character.edit_action_parameters(SP3, Action.LandingHeavy,           File.SPM_LANDING,               -1,                       -1)
    Character.edit_action_parameters(SP3, Action.Pass,                   File.SPM_PLATDROP,              -1,                       -1)
    Character.edit_action_parameters(SP3, Action.ShieldDrop,             File.SPM_PLATDROP,              -1,                       -1)
    Character.edit_action_parameters(SP3, Action.Teeter,                 File.SPM_TEETER,                0x80000000,               -1)
    Character.edit_action_parameters(SP3, Action.TeeterStart,            File.SPM_TEETERSTART,           0x80000000,               -1)
    Character.edit_action_parameters(SP3, Action.FallSpecial,            File.SPM_FALLSPECIAL,           -1,                       -1)
    Character.edit_action_parameters(SP3, Action.LandingSpecial,         File.SPM_LANDING,               -1,                       -1)
    Character.edit_action_parameters(SP3, Action.Tornado,                File.SPM_TUMBLE,                -1,                       -1)
    Character.edit_action_parameters(SP3, Action.EnterPipe,              File.SPM_ENTERPIPE,             -1,                       -1)
    Character.edit_action_parameters(SP3, Action.ExitPipe,               File.SPM_EXITPIPE,              -1,                       -1)
    Character.edit_action_parameters(SP3, Action.ExitPipeWalk,           File.SPM_EXITPIPEWALK,          -1,                       -1)
    Character.edit_action_parameters(SP3, Action.CeilingBonk,            File.SPM_CEILINGBONK,           -1,                       -1)
    Character.edit_action_parameters(SP3, Action.DownStandD,             File.SPM_DOWNSTANDD,            -1,                       -1)
    Character.edit_action_parameters(SP3, Action.DownStandU,             File.SPM_DOWNSTANDU,            -1,                       -1)
    Character.edit_action_parameters(SP3, Action.TechF,                  File.SPM_TECHF,                 -1,                       -1)
    Character.edit_action_parameters(SP3, Action.TechB,                  File.SPM_TECHB,                 -1,                       -1)
    Character.edit_action_parameters(SP3, Action.DownForwardD,           File.SPM_DOWNFORWARDD,          -1,                       -1)
    Character.edit_action_parameters(SP3, Action.DownForwardU,           File.SPM_DOWNFORWARDU,          -1,                       -1)
    Character.edit_action_parameters(SP3, Action.DownBackD,              File.SPM_DOWNBACKD,             -1,                       -1)
    Character.edit_action_parameters(SP3, Action.DownBackU,              File.SPM_DOWNBACKU,             -1,                       -1)
    Character.edit_action_parameters(SP3, Action.DownAttackD,            File.SPM_DOWNATTACKD,           -1,                       -1)
    Character.edit_action_parameters(SP3, Action.DownAttackU,            File.SPM_DOWNATTACKU,           -1,                       -1)
    Character.edit_action_parameters(SP3, Action.Tech,                   File.SPM_TECH,                  -1,                       -1)
    Character.edit_action_parameters(SP3, Action.ClangRecoil,            File.SPM_CLANGRECOIL,           -1,                       -1)
    Character.edit_action_parameters(SP3, Action.CliffClimbQuick2,       File.SPM_CLIFFCLIMBQUICK2,      -1,                       -1)
    Character.edit_action_parameters(SP3, Action.CliffClimbSlow2,        File.SPM_CLIFFCLIMBSLOW2,       -1,                       -1)
    Character.edit_action_parameters(SP3, Action.CliffAttackQuick2,      File.SPM_CLIFFATTACKQUICK2,     -1,                       -1)
    Character.edit_action_parameters(SP3, Action.CliffAttackSlow2,       File.SPM_CLIFFATTACKSLOW2,      -1,                       -1)
    Character.edit_action_parameters(SP3, Action.CliffEscapeQuick2,      File.SPM_CLIFFESCAPEQUICK2,     -1,                       -1)
    Character.edit_action_parameters(SP3, Action.CliffEscapeSlow2,       File.SPM_CLIFFESCAPESLOW2,      -1,                       -1)
    Character.edit_action_parameters(SP3, Action.LightItemPickup,        File.SPM_LIGHTITEMPICKUP,       -1,                       -1)
    Character.edit_action_parameters(SP3, Action.HeavyItemPickup,        File.SPM_HEAVYITEMPICKUP,       -1,                       -1)
    Character.edit_action_parameters(SP3, Action.ItemDrop,               File.SPM_ITEMDROP,              -1,                       -1)
    Character.edit_action_parameters(SP3, Action.ItemThrowDash,          File.SPM_ITEMTHROWDASH,         -1,                       -1)
    Character.edit_action_parameters(SP3, Action.ItemThrowF,             File.SPM_ITEMTHROWF,            -1,                       -1)
    Character.edit_action_parameters(SP3, Action.ItemThrowB,             File.SPM_ITEMTHROWF,            -1,                       -1)
    Character.edit_action_parameters(SP3, Action.ItemThrowU,             File.SPM_ITEMTHROWU,            -1,                       -1)
    Character.edit_action_parameters(SP3, Action.ItemThrowD,             File.SPM_ITEMTHROWD,            -1,                       -1)
    Character.edit_action_parameters(SP3, Action.ItemThrowSmashF,        File.SPM_ITEMTHROWF,            -1,                       -1)
    Character.edit_action_parameters(SP3, Action.ItemThrowSmashB,        File.SPM_ITEMTHROWF,            -1,                       -1)
    Character.edit_action_parameters(SP3, Action.ItemThrowSmashU,        File.SPM_ITEMTHROWU,            -1,                       -1)
    Character.edit_action_parameters(SP3, Action.ItemThrowSmashD,        File.SPM_ITEMTHROWD,            -1,                       -1)
    Character.edit_action_parameters(SP3, Action.ItemThrowAirF,          File.SPM_ITEMTHROWAIRF,         -1,                       -1)
    Character.edit_action_parameters(SP3, Action.ItemThrowAirB,          File.SPM_ITEMTHROWAIRF,         -1,                       -1)
    Character.edit_action_parameters(SP3, Action.ItemThrowAirU,          File.SPM_ITEMTHROWAIRU,         -1,                       -1)
    Character.edit_action_parameters(SP3, Action.ItemThrowAirD,          File.SPM_ITEMTHROWAIRD,         -1,                       -1)
    Character.edit_action_parameters(SP3, Action.ItemThrowAirSmashF,     File.SPM_ITEMTHROWAIRF,         -1,                       -1)
    Character.edit_action_parameters(SP3, Action.ItemThrowAirSmashB,     File.SPM_ITEMTHROWAIRF,         -1,                       -1)
    Character.edit_action_parameters(SP3, Action.ItemThrowAirSmashU,     File.SPM_ITEMTHROWAIRU,         -1,                       -1)
    Character.edit_action_parameters(SP3, Action.ItemThrowAirSmashD,     File.SPM_ITEMTHROWAIRD,         -1,                       -1)
    Character.edit_action_parameters(SP3, Action.HeavyItemThrowF,        File.SPM_HEAVYITEMTHROW,        -1,                       -1)
    Character.edit_action_parameters(SP3, Action.HeavyItemThrowB,        File.SPM_HEAVYITEMTHROW,        -1,                       -1)
    Character.edit_action_parameters(SP3, Action.HeavyItemThrowSmashF,   File.SPM_HEAVYITEMTHROW,        -1,                       -1)
    Character.edit_action_parameters(SP3, Action.HeavyItemThrowSmashB,   File.SPM_HEAVYITEMTHROW,        -1,                       -1)
    Character.edit_action_parameters(SP3, Action.BeamSwordNeutral,       File.SPM_ITEMNEUTRAL,           -1,                       -1)
    Character.edit_action_parameters(SP3, Action.BeamSwordTilt,          File.SPM_ITEMTILT,              -1,                       -1)
    Character.edit_action_parameters(SP3, Action.BeamSwordSmash,         File.SPM_ITEMSMASH,             -1,                       -1)
    Character.edit_action_parameters(SP3, Action.BeamSwordDash,          File.SPM_ITEMDASH,              -1,                       -1)
    Character.edit_action_parameters(SP3, Action.BatNeutral,             File.SPM_ITEMNEUTRAL,           -1,                       -1)
    Character.edit_action_parameters(SP3, Action.BatTilt,                File.SPM_ITEMTILT,              -1,                       -1)
    Character.edit_action_parameters(SP3, Action.BatSmash,               File.SPM_ITEMSMASH,             -1,                       -1)
    Character.edit_action_parameters(SP3, Action.BatDash,                File.SPM_ITEMDASH,              -1,                       -1)
    Character.edit_action_parameters(SP3, Action.FanNeutral,             File.SPM_ITEMNEUTRAL,           -1,                       -1)
    Character.edit_action_parameters(SP3, Action.FanTilt,                File.SPM_ITEMTILT,              -1,                       -1)
    Character.edit_action_parameters(SP3, Action.FanSmash,               File.SPM_ITEMSMASH,             -1,                       -1)
    Character.edit_action_parameters(SP3, Action.FanDash,                File.SPM_ITEMDASH,              -1,                       -1)
    Character.edit_action_parameters(SP3, Action.StarRodNeutral,         File.SPM_ITEMNEUTRAL,           -1,                       -1)
    Character.edit_action_parameters(SP3, Action.StarRodTilt,            File.SPM_ITEMTILT,              -1,                       -1)
    Character.edit_action_parameters(SP3, Action.StarRodSmash,           File.SPM_ITEMSMASH,             -1,                       -1)
    Character.edit_action_parameters(SP3, Action.StarRodDash,            File.SPM_ITEMDASH,              -1,                       -1)
    Character.edit_action_parameters(SP3, Action.RayGunShoot,            File.SPM_ITEMSHOOT,             -1,                       -1)
    Character.edit_action_parameters(SP3, Action.RayGunShootAir,         File.SPM_ITEMSHOOTAIR,          -1,                       -1)
    Character.edit_action_parameters(SP3, Action.FireFlowerShoot,        File.SPM_ITEMSHOOT,             -1,                       -1)
    Character.edit_action_parameters(SP3, Action.FireFlowerShootAir,     File.SPM_ITEMSHOOTAIR,          -1,                       -1)
    Character.edit_action_parameters(SP3, Action.HammerIdle,             File.SPM_HAMMERIDLE,            -1,                       -1)
    Character.edit_action_parameters(SP3, Action.HammerWalk,             File.SPM_HAMMERMOVE,            -1,                       -1)
    Character.edit_action_parameters(SP3, Action.HammerTurn,             File.SPM_HAMMERMOVE,            -1,                       -1)
    Character.edit_action_parameters(SP3, Action.HammerJumpSquat,        File.SPM_HAMMERMOVE,            -1,                       -1)
    Character.edit_action_parameters(SP3, Action.HammerAir,              File.SPM_HAMMERMOVE,            -1,                       -1)
    Character.edit_action_parameters(SP3, Action.HammerLanding,          File.SPM_HAMMERMOVE,            -1,                       -1)
    Character.edit_action_parameters(SP3, Action.ShieldOn,               File.SPM_SHIELDON,              Spiderman.SHIELD_ON,      -1)
    Character.edit_action_parameters(SP3, Action.ShieldOff,              File.SPM_SHIELDOFF,             Spiderman.SHIELD_OFF,     -1)
    Character.edit_action_parameters(SP3, Action.RollF,                  File.SPM_ROLLF,                 -1,                       -1)
    Character.edit_action_parameters(SP3, Action.RollB,                  File.SPM_ROLLB,                 -1,                       -1)
    Character.edit_action_parameters(SP3, Action.StunStartD,             File.SPM_DOWNSTANDD,            -1,                       -1)
    Character.edit_action_parameters(SP3, Action.StunStartU,             File.SPM_DOWNSTANDU,            -1,                       -1)
    Character.edit_action_parameters(SP3, Action.Stun,                   File.SPM_STUN,                  -1,                       -1)
    Character.edit_action_parameters(SP3, Action.Sleep,                  File.SPM_STUN,                  -1,                       -1)
    Character.edit_action_parameters(SP3, Action.Grab,                   File.SPM_GRAB,                  GRAB,                     0x10000000)
    Character.edit_action_parameters(SP3, Action.GrabPull,               File.SPM_GRABPULL,              Spiderman.GRAB_PULL,      0x10000000)
    Character.edit_action_parameters(SP3, Action.ThrowF,                 File.SPM_THROWF,                Spiderman.THROW_F,        -1)
    Character.edit_action_parameters(SP3, Action.ThrowB,                 File.SPM_THROWB,                THROW_B,                  -1)
    Character.edit_action_parameters(SP3, Action.CapturePulled,          File.SPM_CAPTUREPULLED,         -1,                       -1)
    Character.edit_action_parameters(SP3, Action.EggLayPulled,           File.SPM_CAPTUREPULLED,         -1,                       -1)
    Character.edit_action_parameters(SP3, Action.EggLay,                 File.SPM_IDLE,                  -1,                       -1)
    Character.edit_action_parameters(SP3, Action.Taunt,                  File.SPM_TAUNT,                 TAUNT,                    -1)
    Character.edit_action_parameters(SP3, Action.Jab1,                   File.SPM_JAB1,                  Spiderman.JAB1,           -1)
    Character.edit_action_parameters(SP3, Action.Jab2,                   File.SPM_JAB2,                  Spiderman.JAB2,           -1)
    Character.edit_action_parameters(SP3, Action.Jab3,                   File.SPM_JAB3,                  Spiderman.JAB3,            0x40000000)
    Character.edit_action_parameters(SP3, Action.JabLoopStart,           File.SPM_JAB1,                  Spiderman.JAB1,           0)
    Character.edit_action_parameters(SP3, Action.JabLoop,                File.SPM_JAB2,                  Spiderman.JAB2,           0)
    Character.edit_action_parameters(SP3, Action.DashAttack,             File.SPM_DASHATTACK,            Spiderman.DASH_ATTACK,    -1)
    Character.edit_action_parameters(SP3, Action.FTiltHigh,              0,                              0x80000000,               0)
    Character.edit_action_parameters(SP3, Action.FTiltMidHigh,           0,                              0x80000000,               0)
    Character.edit_action_parameters(SP3, Action.FTilt,                  File.SPM_FTILT,                 Spiderman.FORWARD_TILT,   -1)
    Character.edit_action_parameters(SP3, Action.FTiltMidLow,            0,                              0x80000000,               0)
    Character.edit_action_parameters(SP3, Action.FTiltLow,               0,                              0x80000000,               0)
    Character.edit_action_parameters(SP3, Action.UTilt,                  File.SPM_UTILT,                 Spiderman.UP_TILT,        -1)
    Character.edit_action_parameters(SP3, Action.DTilt,                  File.SPM_DTILT,                 Spiderman.DOWN_TILT,      -1)
    Character.edit_action_parameters(SP3, Action.FSmashHigh,             0,                              0x80000000,               0)
    Character.edit_action_parameters(SP3, Action.FSmashMidHigh,          0,                              0x80000000,               0)
    Character.edit_action_parameters(SP3, Action.FSmash,                 File.SPM_FSMASH,                Spiderman.FORWARD_SMASH,  -1)
    Character.edit_action_parameters(SP3, Action.FSmashMidLow,           0,                              0x80000000,               0)
    Character.edit_action_parameters(SP3, Action.FSmashLow,              0,                              0x80000000,               0)
    Character.edit_action_parameters(SP3, Action.USmash,                 File.SPM_USMASH,                Spiderman.UP_SMASH,       -1)
    Character.edit_action_parameters(SP3, Action.DSmash,                 File.SPM_DSMASH,                Spiderman.DOWN_SMASH,     -1)
    Character.edit_action_parameters(SP3, Action.AttackAirN,             File.SPM_ATTACKAIRN,            Spiderman.NEUTRAL_AERIAL, -1)
    Character.edit_action_parameters(SP3, Action.AttackAirF,             File.SPM_ATTACKAIRF,            Spiderman.FORWARD_AERIAL, -1)
    Character.edit_action_parameters(SP3, Action.AttackAirB,             File.SPM_ATTACKAIRB,            Spiderman.BACK_AERIAL,    -1)
    Character.edit_action_parameters(SP3, Action.AttackAirU,             File.SPM_ATTACKAIRU,            Spiderman.UP_AERIAL,      -1)
    Character.edit_action_parameters(SP3, Action.AttackAirD,             File.SPM_ATTACKAIRD,            Spiderman.DOWN_AERIAL,    -1)
    Character.edit_action_parameters(SP3, Action.LandingAirF,            File.SPM_LANDINGAIRF,           -1,                       -1)
    Character.edit_action_parameters(SP3, Action.LandingAirB,            File.SPM_LANDINGAIRB,           -1,                       -1)
    Character.edit_action_parameters(SP3, Action.LandingAirX,            File.SPM_LANDING,               -1,                       -1)
    Character.edit_action_parameters(SP3, Action.AppearLeft1,            File.SPM_ENTRY_1_LEFT,          ENTRY_1,                  0x40000008)
	Character.edit_action_parameters(SP3, Action.AppearRight1,           File.SPM_ENTRY_1_RIGHT,         ENTRY_1,                  0x40000008)
	Character.edit_action_parameters(SP3, Action.AppearLeft2,            File.SPM_ENTRY_2_LEFT,          Spiderman.ENTRY_2,        0x40000008)
	Character.edit_action_parameters(SP3, Action.AppearRight2,           File.SPM_ENTRY_2_RIGHT,         Spiderman.ENTRY_2,        0x40000008)
    Character.edit_action_parameters(SP3, Action.WebBall,                File.SPM_NSP_GROUND,            NSP_GROUND,               -1)
    Character.edit_action_parameters(SP3, Action.WebBallAir,             File.SPM_NSP_AIR,               NSP_AIR,                  -1)
    Character.edit_action_parameters(SP3, Action.WebSwing,               File.SPM_DSP_GROUND,            DSP,                      0x40000000)          //DSP_Ground
    Character.edit_action_parameters(SP3, 0xE7,                          0,                              0x80000000,               0)          //DSP_Collide
    Character.edit_action_parameters(SP3, 0xE8,                          0,                              0x80000000,               0)          //DSP_Land
    Character.edit_action_parameters(SP3, Action.WebSwingAir,            File.SPM_DSP_AIR,               DSP,                      -1)          //DSP_Air
    Character.edit_action_parameters(SP3, 0xEA,                          0,                              0x80000000,               0)          
    Character.edit_action_parameters(SP3, 0xEB,                          0,                              0x80000000,               0)          //Originally USP starts here, however it seemed easier to set it up as new actions like Goemon DSP.
    Character.edit_action_parameters(SP3, 0xEC,                          0,                              0x80000000,               0)
    Character.edit_action_parameters(SP3, 0xED,                          0,                              0x80000000,               0)
    Character.edit_action_parameters(SP3, 0xEE,                          0,                              0x80000000,               0)

    // Modify Actions            // Action                      // Staling ID   // Main ASM                   // Interrupt/Other ASM          // Movement/Physics ASM       // Collision ASM
	Character.edit_action(SP3,   Action.WebBall,                -1,             SpidermanNSP.main,  	      -1,                             -1,                           -1)
	Character.edit_action(SP3,   Action.WebBallAir,             -1,             SpidermanNSP.main,  	      -1,                             SpidermanNSP.physics_,        SpidermanNSP.air_collision_)
    Character.edit_action(SP3,   Action.WebSwing,               -1,             -1,  		                  SpidermanDSP.change_direction_, SpidermanDSP.ground_physics_, SpidermanDSP.ground_collision_)
    Character.edit_action(SP3,   Action.WebSwingAir,            -1,             -1,                           SpidermanDSP.change_direction_, -1,                           SpidermanDSP.air_collision_)

    // Add Action Parameters             // Action Name      // Base Action  // Animation                   // Moveset Data                    // Flags
    Character.add_new_action_params(SP3, USPGround,          -1,             File.SPM_USP_GROUND,           USP,                               0x10000000)
    Character.add_new_action_params(SP3, USPAir,             -1,             File.SPM_USP_AIR,              USP,                               0x10000000)
    Character.add_new_action_params(SP3, USPAirPull,         -1,             File.SPM_USP_AIR_GRABPULL,     Spiderman.USP_PULL,                0x50000000)
    Character.add_new_action_params(SP3, USPAAttack,         -1,             File.SPM_USP_AIR_GRABTHROW,    Spiderman.USP_AIR_THROW,           0x10000000)
    Character.add_new_action_params(SP3, USPEnd,             -1,             File.SPM_USP_WALLEND,          0x80000000,                        0x00000000)
    Character.add_new_action_params(SP3, USPGroundPull,      -1,             File.SPM_USP_GROUND_GRABPULL,  Spiderman.USP_PULL,                0x10000000)
    Character.add_new_action_params(SP3, USPGAttack,         -1,             File.SPM_USP_GROUND_GRABTHROW, Spiderman.USP_GROUND_THROW,        0x50000000)

    // Add Actions                // Action Name     // Base Action  //Parameters                    // Staling ID   // Main ASM                        // Interrupt/Other ASM          // Movement/Physics ASM             // Collision ASM
    Character.add_new_action(SP3, USPGround,         -1,             ActionParams.USPGround,         0x11,           SpidermanUSP.main_,                SpidermanUSP.change_direction_, 0x800D8BB4,                         SpidermanUSP.ground_collision_)
    Character.add_new_action(SP3, USPAir,            -1,             ActionParams.USPAir,            0x11,           SpidermanUSP.main_,                SpidermanUSP.change_direction_, SpidermanUSP.air_physics_,          SpidermanUSP.air_collision_)
    Character.add_new_action(SP3, USPAirPull,        -1,             ActionParams.USPAirPull,        0x11,           SpidermanUSP.air_pull_main_,       0,                              0x800D93E4,                         SpidermanUSP.shared_air_collision_)
    Character.add_new_action(SP3, USPAirWallPull,    -1,             ActionParams.USPAirPull,        0x11,           SpidermanUSP.wall_pull_main_,      0,                              0x800D93E4,                         SpidermanUSP.shared_air_collision_)
    Character.add_new_action(SP3, USPAAttack,        -1,             ActionParams.USPAAttack,        0x11,           0x8014A0C0,                        0,                              SpidermanUSP.throw_air_physics_,    SpidermanUSP.throw_air_collision_)
    Character.add_new_action(SP3, USPEnd,            -1,             ActionParams.USPEnd,            0x11,           0x800D94E8,                        0,                              0x800D9160,                         0x800DE99C)
    Character.add_new_action(SP3, USPGroundPull,     -1,             ActionParams.USPGroundPull,     0x11,           SpidermanUSP.ground_pull_main_,    0,                              0x800D8BB4,                         SpidermanUSP.shared_ground_collision_)
    Character.add_new_action(SP3, USPGAttack,        -1,             ActionParams.USPGAttack,        0x11,           0x8014A0C0,                        0,                              0x800D93E4,                         SpidermanUSP.throw_air_collision_)

    // Modify Menu Action Parameters             // Action          // Animation                // Moveset Data             // Flags
    Character.edit_menu_action_parameters(SP3,   0x0,               File.SPM_IDLE,              -1,                         -1)          // CSS Idle
    Character.edit_menu_action_parameters(SP3,   0x1,               File.SPM_VICTORY_1,         VICTORY_1,                  -1)          // Victory1
    Character.edit_menu_action_parameters(SP3,   0x2,               File.SPM_VICTORY_2,         VICTORY_2,                  -1)          // Victory2
    Character.edit_menu_action_parameters(SP3,   0x3,               File.SPM_VICTORY_3,         VICTORY_3,                  -1)          // Victory3
    Character.edit_menu_action_parameters(SP3,   0x4,               File.SPM_VICTORY_1,         VICTORY_1,                  -1)          // CSS Select
    Character.edit_menu_action_parameters(SP3,   0xD,               File.SPM_1P_POSE,           -1,                         -1)          // 1P Mode Pose
    Character.edit_menu_action_parameters(SP3,   0xE,               File.SPM_CPU_POSE,          -1,                         -1)          // CPU Pose
    Character.edit_menu_action_parameters(SP3,   0x5,               File.SPM_CLAP,              -1,                         -1)
    Character.edit_menu_action_parameters(SP3,   0x9,               File.SPM_CONTINUEFALL,      -1,                         -1)
    Character.edit_menu_action_parameters(SP3,   0xA,               File.SPM_CONTINUEUP,        -1,                         -1)

    // Set action strings
    Character.table_patch_start(action_string, Character.id.SP3, 0x4)
    dw  Spiderman.Action.action_string_table
    OS.patch_end()

    Character.table_patch_start(ground_usp, Character.id.SP3, 0x4)
    dw      SpidermanUSP.ground_initial_
    OS.patch_end()
    Character.table_patch_start(air_usp, Character.id.SP3, 0x4)
    dw      SpidermanUSP.air_initial_
    OS.patch_end()
    Character.table_patch_start(ground_dsp, Character.id.SP3, 0x4)
    dw      SpidermanDSP.ground_initial_
    OS.patch_end()
    Character.table_patch_start(air_dsp, Character.id.SP3, 0x4)
    dw      SpidermanDSP.air_initial_
    OS.patch_end()

    Character.table_patch_start(rapid_jab, Character.id.SP3, 0x4)
    dw      Character.rapid_jab.DISABLED        // disable rapid jab
    OS.patch_end()

    // Set crowd chant FGM to none
    Character.table_patch_start(crowd_chant_fgm, Character.id.SP3, 0x2)
    dh  0x02B7
    OS.patch_end()

    // Use Mario's initial/grounded script.
    Character.table_patch_start(initial_script, Character.id.SP3, 0x4)
    dw 0x800D7DCC
    OS.patch_end()
    Character.table_patch_start(grounded_script, Character.id.SP3, 0x4)
    dw 0x800DE428
    OS.patch_end()

    // Remove entry script (no Blue Falcon).
    Character.table_patch_start(entry_script, Character.id.SP3, 0x4)
    dw 0x8013DD68                           // skips entry script
    OS.patch_end()

    // Set default costumes
    Character.set_default_costumes(Character.id.SP3, 0, 1, 2, 3, 0, 4, 2)
    Teams.add_team_costume(YELLOW, SP3, 0x6)

    // Shield colors for costume matching
    Character.table_patch_start(costume_shield_color, Character.id.SP3, 0x4)
    dw Spiderman.costume_shield_color
    OS.patch_end()

    // Set Kirby star damage
    Character.table_patch_start(kirby_inhale_struct, 0x8, Character.id.SP3, 0xC)
    dw Character.kirby_inhale_struct.star_damage.FALCON
    OS.patch_end()
    
    // Set SP3 as variant
    Character.table_patch_start(variants, Character.id.SP3, 0x4)
    db      Character.id.SPM
    OS.patch_end()

    Character.table_patch_start(variant_original, Character.id.SP3, 0x4)
    dw      Character.id.SPM
    OS.patch_end()
}
