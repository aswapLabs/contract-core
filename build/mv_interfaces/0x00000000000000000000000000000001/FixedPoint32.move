module 0x1::FixedPoint32 {

    use 0x1::FixedPoint32;

    struct FixedPoint32 has copy, drop, store {
        value: u64,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun create_from_rational(a0: u64, a1: u64): FixedPoint32::FixedPoint32;
    native public fun create_from_raw_value(a0: u64): FixedPoint32::FixedPoint32;
    native public fun divide_u64(a0: u64, a1: FixedPoint32::FixedPoint32): u64;
    native public fun get_raw_value(a0: FixedPoint32::FixedPoint32): u64;
    native public fun multiply_u64(a0: u64, a1: FixedPoint32::FixedPoint32): u64;

}
