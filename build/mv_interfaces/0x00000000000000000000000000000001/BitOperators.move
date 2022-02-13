module 0x1::BitOperators {

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun and(a0: u64, a1: u64): u64;
    native public fun lshift(a0: u64, a1: u8): u64;
    native public fun not(a0: u64): u64;
    native public fun or(a0: u64, a1: u64): u64;
    native public fun rshift(a0: u64, a1: u8): u64;
    native public fun xor(a0: u64, a1: u64): u64;

}
