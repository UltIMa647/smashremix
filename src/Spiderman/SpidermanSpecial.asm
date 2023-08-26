// SpidermanSpecial.asm

// This file contains subroutines used by Spider-Man's special moves.

scope SpidermanNSP {
    constant Y_SPEED(0x4210)                // current setting - float32 36
    constant Y_SPEED_STALE(0x4180)          // current setting - float32 16
    constant Y_SPEED_SECOND(0x4100)          // current setting - float32 8
 // @ Description 
    // main subroutine for Wolf's Blaster
    scope main: {
        addiu   sp, sp, -0x0040
        sw      ra, 0x0014(sp)
		swc1    f6, 0x003C(sp)
        swc1    f8, 0x0038(sp)
        sw      a0, 0x0034(sp)
		addu	a2, a0, r0
        lw      v0, 0x0084(a0)                      // loads player struct
        
        or      a3, a0, r0
        lw      t6, 0x017C(v0)
        beql    t6, r0, _idle_transition_check      // this checks moveset variables to see if projectile should be spawned
        lw      ra, 0x0014(sp)
        mtc1    r0, f0
        sw      r0, 0x017C(v0)                      // clears out variable so he only fires one shot
        addiu   a1, sp, 0x0020
        swc1    f0, 0x0020(sp)                      // x origin point
        swc1    f0, 0x0024(sp)                      // y origin point
        swc1    f0, 0x0028(sp)                      // z origin point
        lw      a0, 0x0928(v0)
        sw      a3, 0x0030(sp)
        jal     0x800EDF24                          // generic function used to determine projectile origin point
        sw      v0, 0x002C(sp)
        lw      v0, 0x002C(sp)
        lw      a3, 0x0030(sp)
        sw      r0, 0x001C(sp)
        or      a0, a3, r0
        addiu   a1, sp, 0x0020
        jal     projectile_stage_setting            // this sets the basic features of a projectile
        lw      a2, 0x001C(sp)
		lw      a2, 0x0034(sp)
        lw      ra, 0x0014(sp)
		
		// checks frame counter to see if reached end of the move
        _idle_transition_check:
        mtc1    r0, f6
        lwc1    f8, 0x0078(a2)
        c.le.s  f8, f6
        nop
        bc1fl   _end
        lw      ra, 0x0014(sp)
        lw      a2, 0x0034(sp)
        jal     0x800DEE54
        or      a0, a2, r0
         _end:
		lw      a0, 0x0034(sp)
        lwc1    f6, 0x003C(sp)
        lwc1    f8, 0x0038(sp)
        lw      ra, 0x0014(sp)
        addiu   sp, sp, 0x0040
        jr      ra
        nop

		projectile_stage_setting:
        addiu   sp, sp, -0x0050
        sw      a2, 0x0038(sp)
        lw      t7, 0x0038(sp)
		sw      s0, 0x0018(sp)
        li      s0, _blaster_fireball_struct       // load blaster format address

        
        sw      a1, 0x0034(sp)
        sw      ra, 0x001C(sp)
        lw      t6, 0x0084(a0)
        lw      t0, 0x0024(s0)
        lw      t1, 0x0028(s0)
        li      a1, _blaster_projectile_struct		// load projectile addresses
        lw      a2, 0x0034(sp)
        lui     a3, 0x8000
        sw      t6, 0x002C(sp)
        //sw      t0, 0x0008(a1)        // would revise default pointer, which has another pointer, which is to the hitbox data
        jal     0x801655C8                // This is a generic routine that does much of the work for defining all projectiles
        sw      t1, 0x000C(a1)

        bnez    v0, _projectile_branch
        sw      v0, 0x0028(sp)
        beq     r0, r0, _end_stage_setting
        or      v0, r0, r0
        
        _projectile_branch:
        lw      v1, 0x0084(v0)
        lui     t2, 0x3f80              // load 1(fp) into f2
        addiu   at, r0, 0x0001
        mtc1    r0, f4
        sw      t2, 0x029C(v1)           // save 1(fp) to projectile struct free space
        lw      t3, 0x0000(s0)
        sw      t3, 0x0268(v1)
   
        OS.copy_segment(0xE3268, 0x2C)   
        lw      t6, 0x002C(sp)
		lwc1    f6, 0x0020(s0)           // load speed (integer)
        lw      v1, 0x0024(sp)
        lw      t7, 0x0044(t6)
        mul.s   f8, f0, f6
        lwc1    f12, 0x0020(sp)
        mtc1    t7, f10
        nop
        cvt.s.w f16, f10
        mul.s   f18, f8, f16
        jal     0x800303F0
        swc1    f18, 0x0020(v1)
        lwc1    f4, 0x0020(s0)
        lw      v1, 0x0024(sp)
        lw      a0, 0x0028(sp)
        mul.s   f6, f0, f4
        swc1    f6, 0x0024(v1)
        lw      t8, 0x0074(a0)
        lwc1    f10, 0x002C(s0)
        lw      t9, 0x0080(t8)
        // This ensures the projectile faces the correct direction
        jal     0x80167FA0
        swc1    f10, 0x0088(t9)
        lw      v0, 0x0028(sp)

        _end_stage_setting:
        lw      ra, 0x001C(sp)
        lw      s0, 0x0018(sp)
        addiu   sp, sp, 0x0050
        jr  	ra
        nop

		// this subroutine seems to have a variety of functions, but definetly deals with the duration of move and result at the end of duration
        blaster_duration:
        addiu   sp, sp, -0x0024
        sw      ra, 0x0014(sp)
        sw      a0, 0x0020(sp)
        swc1    f10, 0x0024(sp)
        lw      a0, 0x0084(a0)
        sw      a0, 0x001C(sp)
        
        _continue:
        addiu   t8, r0, r0          // used to use free space area, but for no apparent reason, affects graphics
        //lw      t8, 0x029C(a0)
        li      t0, _blaster_fireball_struct
        addu    v0, r0, t0
        lw      a1, 0x000C(v0)
        lw      a2, 0x0004(v0)
        lw      t1, 0x0020(sp)
        addiu   t2, r0, r0          // used to use free space area, but for no apparent reason, effects graphics
        lw      v1, 0x0074(t1)
        or      v0, r0, r0
        lwc1    f8, 0x0020(a0)      // load current speed
		lui		at, 0x3F84          // speed multiplier (accel) loaded in at (1.03125)
		mtc1	at, f6              // move speed multiplier to floating point register
		mul.s   f8, f8, f6          // speed multiplied by accel
        
        
        lw      at, 0x0004(t0)      // load max speed
        mtc1    at, f6
        lw      at, 0x029C(a0)      // load multiplier that is typically one, unless reflected
        mtc1    at, f10
        mul.s   f6, f6, f10
        c.le.s  f8, f6
        nop
        bc1f    _scaling
        swc1    f6, 0x0020(a0)      // if speed is greater than max rightward velocity, save max speed
        neg.s   f6, f6
        c.le.s  f8, f6
        nop
        bc1t    _scaling
        swc1    f6, 0x0020(a0)      // if speed is less than max leftward velocity, save max speed
		swc1    f8, 0x0020(a0)      // save new speed amount to projectile hitbox information
        
        _scaling:
        // v1 = projectile joint 1
        // a0 = projectile struct
        // t1 = projectile object
        lwc1    f6, 0x0020(a0)      // ~
        abs.s   f6, f6              // f6 = absolute current speed
        lui     at, 0x41B0          // ~
        mtc1    at, f8              // f8 = initial speed (currently 22)
        lui     at, 0x3E80          // ~
        mtc1    at, f10             // f10 = 0.25
        add.s   f6, f6, f8          // ~
        add.s   f6, f6, f8          // ~
        add.s   f6, f6, f8          // ~
        mul.s   f6, f6, f10         // f6 = (current speed + 66) * 0.25
        div.s   f6, f6, f8          // f6 = x size multiplier (adjusted current speed / initial speed)
        swc1    f6, 0x0040(v1)      // store x size multiplier to projectile joint
        add.s   f10, f10, f10       // f10 = 0.5
        mul.s   f6, f6, f10         // ~
        add.s   f6, f6, f10         // f6 = (x size multiplier * 0.5) + 0.5
        add.s   f10, f10, f10       // f10 = 1.0
        div.s   f6, f10, f6         // f6 = y size multiplier (1.0 / ((x size multiplier * 0.5) + 0.5))
        swc1    f6, 0x0044(v1)      // store y size multiplier to projectile joint
        
        _end_duration:
        lw      ra, 0x0014(sp)
        lwc1    f10, 0x0024(sp)
        addiu   sp, sp, 0x0024
        jr      ra
        nop

        _hitbox_end:
        OS.copy_segment(0xE396C, 0x38)
        // swc1 f4, 0x0148(v0)
        OS.copy_segment(0xE39A8, 0x30)
        
        // this subroutine determines the behavior of the projectile upon reflection
        blaster_reflection:
        addiu   sp, sp, -0x0018
        sw      ra, 0x0014(sp)
        sw      a0, 0x0018(sp)
        lw      a0, 0x0084(a0)      // loads active projectile struct
        lw      t0, 0x0008(v0)
        addiu   t7, r0, Character.id.SPM
        bnel    t0, t7, _standard
        lui     t7, 0x3F80          // load normal reflect multiplier if not wolf and thereby top speed of wolf projectile will not increase
        li      t7, 0x3FC90FDB      // load reflect multiplier
        _standard:
        mtc1    t7, f4              // move reflect multiplier to floating point
        sw      t7, 0x029C(a0)      // save multiplier to free space to increase max speed
        lw      t7, 0x0008(a0)
        li      t0, _blaster_fireball_struct // load fireball struct to pull parameters
        lw      t0, 0x0000(t0)      // loads max duration from fireball struct
        sw      t0, 0x0268(a0)      // save max duration to active projectile struct current remaining duration
        lw      a1, 0x0084(t7)      // loads reflective character's struct

        // Before determining new direction, multiply speed.
        lw      t6, 0x0044(a1)      // loads player direction 1 or -1 in fp
        lwc1    f0, 0x0020(a0)      // loads projectile velocity
        mul.s   f0, f0, f4          // multiply current speed by reflection speed multiplier
        nop
        swc1    f0, 0x0020(a0)      // save new speed
        nop
        jal     0x801680EC          // go to the default subroutine that determines direction
        nop

        // old routine for reference, was based on 0x801680EC
        // lw      t6, 0x0044(a1)      // loads direction 1 or -1 in fp
        // lwc1    f0, 0x0020(a0)      // loads velocity
        // mul.s   f0, f0, f4          // multiply current speed by reflection speed multiplier (not original logic)
        // mtc1    r0, f10             // move 0 to f10
        // mtc1    t6, f4              // place direction in f4
        // nop
        // cvt.s.w f6, f4              // cvt to sw floating point
        // mul.s   f8, f0, f6          // change direction of projectile to the opposite direction via multiplication
        // //  lw      t6, 0x0004(t0)      // load max speed
        // //  mtc1    t6, f6              // move max speed to f6
        // c.lt.s  f8, f10             // current velocity compared to 0 (less than or equal to)
        // nop
        // bc1f    _branch              // jump if velocity is greater than 0
        // nop
        // neg.s   f16, f0
        // swc1    f16, 0x0020(a0)     // save velocity
        
        _branch:
        lw      a0, 0x0018(sp)
        lw      v0, 0x0084(a0)      // load active projectile struct
        mtc1    r0, f6              // move 0 to f6
        lwc1    f4, 0x0020(v0)      // load current velocity of projectile
        c.le.s  f6, f4              // compare 0 to current velocity to see if now traveling leftward
        nop
        bc1f    _left               // jump if 0 is greater than velocity, this means the projectile is traveling leftward
        nop
        li        at, 0x3FC90FDB
        mtc1      at, f8    
        lw      t6, 0x0074(a0)
        j       _end_reflect
        swc1    f8, 0x0034(t6)
        _left:
        li        at, 0xBFC90FDB
        mtc1      at, f10
        lw      t7, 0x0074(a0)
        swc1    f10, 0x0034(t7)
        _end_reflect:
        lw      ra, 0x0014(sp)
        addiu   sp, sp, 0x0018
        or      v0, r0, r0
        jr      ra
        nop
        
		
		_blaster_projectile_struct:
        dw 0x00000000                   // this has some sort of bit flag to tell it to use secondary type display list?
		dw 0x00000000
        dw Character.SPM_file_6_ptr    // pointer to file
        dw 0x00000000                   // 00000000
        dw 0x12480000                   // rendering routine?
        dw blaster_duration             // duration (default 0x80168540) (samus 0x80168F98)
        dw 0x80175914                   // collision (0x801685F0 - Mario) (0x80169108 - Samus)
        dw 0x80175958    		        // after_effect 0x801691FC, this one is used when grenade connects with player
        dw 0x80175958                   // after_effect 0x801691FC, used when touched by player when object is still, by setting to null, nothing happens
        dw 0x8016DD2C                   // determines behavior when projectile bounces off shield, this uses Master Hand's projectile coding to determine correct angle of graphic (0x8016898C Fox)
        dw 0x80175958                   // after_effect                // rocket_after_effect 0x801691FC
        dw blaster_reflection           // OS.copy_segment(0x1038FC, 0x04)            // this determines reflect behavior (default 0x80168748)
        dw 0x80175958                   // This function is run when the projectile is used on ness while using psi magnet
        OS.copy_segment(0x103904, 0x0C) // empty 

		
		_blaster_fireball_struct:
        dw 100                          // 0x0000 - duration (int)
        float32 200                     // 0x0004 - max speed
        float32 22                      // 0x0008 - min speed
        float32 0                       // 0x000C - gravity
        float32 0                       // 0x0010 - bounce multiplier
        float32 0                       // 0x0014 - rotation angle
        float32 0                       // 0x0018 - initial angle (ground)
        float32 0                       // 0x001C   initial angle (air)
        float32 22                      // 0x0020   initial speed
        dw Character.SPM_file_6_ptr    // 0x0024   projectile data pointer
        dw 0                            // 0x0028   unknown (default 0)
        float32 0                       // 0x002C   palette index (0 = mario, 1 = luigi)
        OS.copy_segment(0x1038A0, 0x30)
		}
		
   // @ Description
   // Subroutine which handles air collision for neutral special actions
    scope air_collision_: {
        addiu   sp, sp,-0x0018              // allocate stack space
        sw      ra, 0x0014(sp)              // store ra
        li      a1, air_to_ground_          // a1(transition subroutine) = air_to_ground_
        jal     0x800DE6E4                  // common air collision subroutine (transition on landing, no ledge grab)
        nop 
        lw      ra, 0x0014(sp)              // load ra
        addiu   sp, sp, 0x0018              // deallocate stack space
        jr      ra                          // return
        nop
    }
    
    // @ Description
    // Subroutine which handles ground to air transition for neutral special actions
    scope air_to_ground_: {
        addiu   sp, sp,-0x0038              // allocate stack space
        sw      ra, 0x001C(sp)              // store ra
        sw      a0, 0x0038(sp)              // 0x0038(sp) = player object
        lw      a0, 0x0084(a0)              // a0 = player struct
        jal     0x800DEE98                  // set grounded state
        sw      a0, 0x0034(sp)              // 0x0034(sp) = player struct
        lw      v0, 0x0034(sp)              // v0 = player struct
        lw      a0, 0x0038(sp)              // a0 = player object
        
        //lw      a2, 0x0008(v0)              // load character ID
        //lli     a1, Character.id.KIRBY      // a1 = id.KIRBY
        //beql    a1, a2, _change_action      // if Kirby, load alternate action ID
        //lli     a1, Kirby.Action.SPM_NSP_Ground
        //lli     a1, Character.id.JKIRBY     // a1 = id.JKIRBY
        //beql    a1, a2, _change_action      // if J Kirby, load alternate action ID
        //lli     a1, Kirby.Action.SPM_NSP_Ground
        
        
        addiu   a1, r0, 0x00E1              // a1 = equivalent ground action for current air action
        _change_action:
        lw      a2, 0x0078(a0)              // a2(starting frame) = current animation frame
        lui     a3, 0x3F80                  // a3(frame speed multiplier) = 1.0
        lli     t6, 0x0001                  // ~
        jal     0x800E6F24                  // change action
        sw      t6, 0x0010(sp)              // argument 4 = 1 (continue hitbox)
        lw      ra, 0x001C(sp)              // load ra
        addiu   sp, sp, 0x0038              // deallocate stack space
        jr      ra                          // return
        nop
    }	
	}