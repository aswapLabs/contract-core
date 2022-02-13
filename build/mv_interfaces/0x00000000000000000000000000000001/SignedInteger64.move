module 0x1::SignedInteger64 {

    use 0x1::SignedInteger64;

    struct SignedInteger64 has copy, drop, store {
        value: u64,
        is_negative: bool,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun add_u64(a0: u64, a1: SignedInteger64::SignedInteger64): SignedInteger64::SignedInteger64;
    native public fun create_from_raw_value(a0: u64, a1: bool): SignedInteger64::SignedInteger64;
    native public fun divide_u64(a0: u64, a1: SignedInteger64::SignedInteger64): SignedInteger64::SignedInteger64;
    native public fun get_value(a0: SignedInteger64::SignedInteger64): u64;
    native public fun is_negative(a0: SignedInteger64::SignedInteger64): bool;
    native public fun multiply_u64(a0: u64, a1: SignedInteger64::SignedInteger64): SignedInteger64::SignedInteger64;
    native public fun sub_u64(a0: u64, a1: SignedInteger64::SignedInteger64): SignedInteger64::SignedInteger64;

}
