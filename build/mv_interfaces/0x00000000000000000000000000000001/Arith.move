module 0x1::Arith {

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun adc(a0: u64, a1: u64, a2: &mut u64): u64;
    native public fun combine_u64(a0: u64, a1: u64): u64;
    native public fun sbb(a0: u64, a1: u64, a2: &mut u64): u64;
    native public fun split_u64(a0: u64): (u64, u64);

}
