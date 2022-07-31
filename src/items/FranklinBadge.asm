// @ Description
// These constants must be defined for an item.
constant SPAWN_ITEM(Item.spawn_custom_item_based_on_tomato_)
constant SHOW_GFX_WHEN_SPAWNED(OS.TRUE)
constant PICKUP_ITEM_MAIN(pickup_franklin_badge) 
constant PICKUP_ITEM_INIT(0)
constant DROP_ITEM(0x801745FC)
constant THROW_ITEM(0)
constant PLAYER_COLLISION(0)

// @ Description
// Offset to item in file 0xFB.
constant FILE_OFFSET(0xF20)

// @ Description
// Item info array
item_info_array:
constant ITEM_INFO_ARRAY_ORIGIN(origin())
dw 0x0                                  // 0x00 - item ID (will be updated by Item.add_item
dw 0x8018D040                           // 0x04 - hard-coded pointer to file 0xFB
dw FILE_OFFSET                          // 0x08 - offset to item footer in file 0xFB
dw 0x1C000000                           // 0x0C - (value - 1 * 4) + 0x8003DC24 = pointer to draw-related routine, 0x1C = no billboarding and transforms permitted

dw 0                                    // 0x10 - hitbox enabler/offset (0 = none, appends to 0x10C)
dw 0x801744C0                           // 0x14 - spawn behaviour routine (tomato, appends to 0x378)
dw 0x80174524                           // 0x18 - ground transition routine  (appends to 0x37C)
dw 0                                    // 0x1C - hurtbox collision routine (appends to 0x380)

dw 0                                    // 0x20 - collide with shield (appends to 0x384)
dw 0                                    // 0x24 - collide with shield edge (appends to 0x388)
dw 0                                    // 0x28 - collide with hitbox ( appends to 0x38C)
dw 0                                    // 0x2C - collide with reflector (appends to 0x390)

item_state_table:
dw 0                                    // 0x30 - ?
dw 0                                    // 0x34 - ?
dw 0x801744FC                           // 0x38 - ? resting state? (using Maxim Tomato)
dw 0                                    // 0x3C - ?
dw 0, 0, 0, 0                           // 0x40 - 0x4C - ?
dw 0                                    // 0x50 - ?
dw 0x801744C0                           // 0x54 - ? (using Maxim Tomato)
dw 0x80174524                           // 0x58 - ? (using Maxim Tomato)
dw 0                                    // 0x5C - ?
dw 0, 0, 0, 0                           // 0x60 - 0x6C - ?
dw 0                                    // 0x70 - ?
dw 0x801744C0                           // 0x74 - ? (using Maxim Tomato)
dw 0x801745CC                           // 0x78 - ? (using Maxim Tomato)
dw 0                                    // 0x7C - ?
dw 0, 0, 0, 0                           // 0x80 - 0x8C - ?
dw 0, 0, 0, 0                           // 0x90 - 0x9C - ?

// @ Description
// Duration of Franklin Badge item
constant BADGE_DURATION(20*60)          // duration = 20 seconds
constant GFX_ROUTINE(0x70)              // gfx routine index

// @ Description
// Main item pickup routine for cloaking device.
scope pickup_franklin_badge: {

    OS.save_registers()

    // check if player already has a franklin badge
    li      t0, players_with_franklin_badge
    lbu     t1, 0x000D(a0)              // t1 = port
    sll     t2, t1, 0x0002              // t2 = offset to player entry
    addu    t0, t0, t2                  // t0 = address of players badge
    lw      t3, 0x0000(t0)              // get current value
    bnez    t3, _duplicate_badge        // skip badge setup if there is already a badge
    sw      t0, 0x0020(sp)              // save address of players badge

    // setup badge
    li      at, GFXRoutine.port_override.override_table // load override table for gfx routines
    addu    t2, at, t2                  // get address of player entry in gfx override table
    addiu   t7, r0, GFX_ROUTINE
    sw      t7, 0x0000(t2)              // save f badge gfx routine in override table
    sw      at, 0x0A28(a0)              // save gfx routine to player struct (todo: this is a typo but it works?)
    Render.register_routine(handle_active_franklin_badge_)    // register routine that handles the countdown
    // v0 = routine handler
    lw      a0, 0x0010(sp)              // a0 = player struct
    lw      a2, 0x0018(sp)              // a2 = item object
    lw      t0, 0x0020(sp)              // t0 = players_with_franklin_badge table
    sw      a0, 0x0040(v0)              // save player struct in handler object
    lw      at, 0x0084(a2)
    sw      at, 0x0044(v0)              // save item struct in handler object
    sw      t0, 0x0048(v0)              // save address of players badge
    sw      v0, 0x0000(t0)              // save routine handler to players franklin badge entry
    addiu   at, r0, BADGE_DURATION
    sh      at, 0x004C(v0)              // save timer value to handler obj

    li      at, reflect_hitbox_struct   // a0 = reflect hitbox
    sw      at, 0x003C(v0)              // write reflect hitbox to routine handler
    sw      at, 0x0850(a0)              // write reflect hitbox to player struct

    lui     at, 0x0400                  // at = reflect/absorb flag
    b       _end
    sw      at, 0x0038(v0)              // save it to handler object

    _duplicate_badge:
    addiu   at, r0, BADGE_DURATION
    sh      at, 0x004C(t3)              // overwrite duration

    _end:
    OS.restore_registers()

    // Continue after damage restore routine in tomato/heart pickup routine
    sw      a2, 0x0018(sp)              // save a2 to where the rest of the routine expects it
    j       0x80145C4C
    sw      a3, 0x001C(sp)              // save a3 to where the rest of the routine expects it
}

// @ Description
// handles an active franklin badge. No Franklin Badge item exists at this point.
scope handle_active_franklin_badge_: {
    addiu   sp, sp, -0x24           // allocate sp    
    sw      ra, 0x0014(sp)          // store registers
    sw      a0, 0x0020(sp)          // save routine handler
    sw      s1, 0x0004(sp)

    // 0x0034(a0) gfx routine
    // 0x0038(a0) reflect flag
    // 0x003C(a0) reflect hitbox struct
    // 0x0040(a0) player struct
    // 0x0044(a0) item struct
    // 0x0048(a0) pointer to player entry in franklin badge array
    // 0x004C(a0) timer
    lw      a0, 0x0020(sp)          // a0 = handler object
    lw      a1, 0x0040(a0)          // a1 = item owner struct

    lw      v0, 0x0024(a1)          // v0 = players current action
    addiu   at, r0, Action.Revive1  // at = Revive action id
    beq     v0, at, _destroy_badge  // destroy badge if player is reviving
    addiu   t2, r0, 0x0001          // t2 = 1 (clear reflect flag on destroy)

    lw      at, 0x003C(a0)          // at = pointer to custom reflect hitbox
    lw      t8, 0x0850(a1)          // t8 = current pointer to reflect hitbox (in case fox/ness overwrites it)
    beq     at, t8, _maintain_badge // branch if reflect hitbox is still badges hb
    addiu   t2, r0, 0x0000          // t2 = 0 (dont clear reflect flag on destroy)

    // if here, player is probably reflecting or absorbing
    lw      v0, 0x018C(a1)          // v0 = current players reflect/absorb flag
    bnez    v0, subtract_timer      // don't maintain franklin badge if player is still reflecting
    addiu   t2, r0, 0x0001          // t2 = 1 (clear reflect flag on destroy)

    _maintain_badge:
    sw      at, 0x0850(a1)          // save franklin badge hitbox to player struct
    lw      at, 0x0038(a0)          // at = fox's reflect flag
    lw      v0, 0x018C(a1)          // v0 = current players flag
    or      v0, at, v0              // v0 and at = new, combined flag
    sw      v0, 0x018C(a1)          // save spefical flag to player struct

    subtract_timer:
    lh      v0, 0x004C(a0)          // v0 = timer value
    addiu   t8, v0, 0xffff          // timer -= 1
    sh      t8, 0x004C(a0)          // save timer
    addiu   at, r0, 0x0001
    bne     v0, at, _end            // don't destroy if timer value not 1
    nop

    _destroy_badge:
    lw      at, 0x0048(a0)          // at = pointer to players index in franklin badge array
    sw      r0, 0x0000(at)          // remove player from franklin badge array

    addiu   at, r0, Action.Revive1  // at = Revive action id
    beq     v0, at, _destroy_branch_1 // don't touch player flag if they are dead
    nop

    bnez    t2, _destroy_branch_1   // clear reflect flag if t2 != 0
    nop

    // remove reflect flag to prevent crash when badge gets removed between actions (temporary fix)
    li      at, 0xFBFFFFFF          // at = bitmask for fox reflect
    lw      v0, 0x018C(a1)          // a0 = current players flag
    and     v0, at, v0              // v0 = players current flag with reflect flag removed
    sw      v0, 0x018C(a1)          // overwrite flag in player struct

    // remove player gfx, based on star
    _destroy_branch_1:
    li      at, GFXRoutine.port_override.override_table
    lbu     t1, 0x000D(a1)              // t1 = port
    sll     t2, t1, 0x0002              // t2 = offset to player entry
    addu    t0, at, t2                  // t0 = address of players gfx routine
    addiu   at, r0, GFX_ROUTINE         // at = franklin badge gfx routine index
    lw      t1, 0x0000(t0)              // t1 = current players override gfx routine
    bne     at, t1, _destroy_branch_2   // branch if franklin badge gfx routine is not here
    lw      a0, 0x0004(a1)              // a0 = player object
    sw      r0, 0x0000(t0)              // remove franklin badge gfx override flag
    jal     0x800E98D4                  // run players default gfx routine
    nop

    _destroy_branch_2:
    jal     Render.DESTROY_OBJECT_
    lw      a0, 0x0020(sp)          // argument = routine handler

    _end:
    lw      s1, 0x0004(sp)          //
    lw      ra, 0x0014(sp)          // restore registers
    addiu   sp, sp, 0x24            // deallocate sp
    jr      ra                      // return
    nop                             // ~
}

// @ Description
// based on Fox's reflect routine that sets his action @ 0x8015CEE8
// No action change for Franklin Badge, just fgm, flag update and gfx
scope reflect_initial_: {
    addiu   sp, sp, -0x20             // allocate sp
    sw      ra, 0x0004(sp)            // store registers
    sw      s0, 0x0008(sp)            // ~
    sw      s1, 0x0010(sp)            // ~
    sw      a0, 0x0014(sp)            // ~

    // a0 = player object
    lw      v0, 0x0084(a0)            // v0 = player struct
    lw      t9, 0x014C(v0)            // ?
    lbu     t2, 0x018C(v0)            // get flag from reflect bitfield
    ori     t3, t2, 0x0004            // add a flag into reflect bitfield
    sb      t3, 0x018C(v0)            // overwrite it

    // draw gfx
    move    s0, a0                    // s0 = player object
    lw      s1, 0x0084(s0)            // s1 = player stuct
    lw      a0, 0x78(s1)              // a0 = player location struct
    jal     reflect_gfx_              // Ness spark gfx
    nop

    // play fgm
    jal     0x800269C0                // play FGM
    lli     a0, 0x041B                // FGM id = franklin badge reflect

    lw      ra, 0x0004(sp)            // restore registers
    lw      s0, 0x0008(sp)            // ~
    lw      s1, 0x0010(sp)            // ~
    lw      a0, 0x0014(sp)            // ~
    jr      ra                        // return
    addiu   sp, sp, 0x20              // and deallocate sp
}

// @ Description
// based on yellow spark gfx routine @ 0x80101630
// No action change for Franklin Badge, just fgm, flag update and gfx
scope reflect_gfx_: {
    addiu    sp, sp, -0x18
    or       a2, a0, r0
    sw       ra, 0x0014(sp)
    lui      a0, 0x8013
    lw       a0, 0x13C4(a0)
    sw       a2, 0x0018(sp)
    jal      0x800CE870               // load and create gfx object
    addiu    a1, r0, 0x0005           // a1 = gfx id for ledge grab (green circle)
    lw       a2, 0x0018(sp)

    beqz     v0, _end
    or       v1, v0, r0

    // get/set coords of player torso to gfx struct
    lw      a0, 0x900(s1)               // a0 = torso part
    jal     0x800EDF24                  // returns x/y/z coordinates of the part in a0 to a1
    addiu   a1, v0, 0x0020              // a1 = address to write coordinates (gfx struct)

    _end:
    lw       ra, 0x0014(sp)
    addiu    sp, sp, 0x18
    or       v0, v1, r0
    jr       ra
    nop

}

// @ Description
// Clears the timer and routine for active lightning.
scope clear_active_franklin_badges_: {
    li      t8, players_with_franklin_badge      // t8 = array to clear
    sw      r0, 0x0000(t8)              // clear ptrs
    sw      r0, 0x0004(t8)              // ~
    sw      r0, 0x0008(t8)              // ~
    sw      r0, 0x000C(t8)              // ~
    jr      ra
    nop
}

// @ Description
// stores player struct
players_with_franklin_badge:
dw 0
dw 0
dw 0
dw 0
// Based on Falcos reflect hitbox written to 0x850 of player struct
reflect_hitbox_struct:
dh 0x0000                         // index to custom reflect routine table. Reflect.custom_reflect_table
dh Reflect.reflect_type.CUSTOM            // reflect type. Custom value of 4.  ( fox = 0, ??? = 1, bat = 2 )
dw 0x00000004                     // ?
dw 0x00000000                     // ?
dw 0x42700000                     // ?
dw 0x00000000                     // ?
dw 0x43AF0000                     // x scale?
dw 0x43AF0000                     // y scale?
dw 0x43AF0000                     // z scale?
dw 0x18000000                     // hp value maybe


