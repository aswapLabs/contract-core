module 0xA7B8DAB322448AF454FCCAFFBCBF247::SafeMath {

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun safe_compare(a0: u128, a1: u128, a2: u128, a3: u128): u8;
    native public fun safe_more_than_or_equal(a0: u128, a1: u128, a2: u128, a3: u128): bool;
    native public fun safe_mul_div(a0: u128, a1: u128, a2: u128): u128;
    native public fun safe_mul_sqrt(a0: u128, a1: u128): u128;
    native public fun sqrt(a0: u128): u64;

}
