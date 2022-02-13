module 0x1::Math {

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun avg(a0: &vector<u128>): u128;
    native public fun mul_div(a0: u128, a1: u128, a2: u128): u128;
    native public fun pow(a0: u64, a1: u64): u128;
    native public fun sqrt(a0: u128): u64;
    native public fun sum(a0: &vector<u128>): u128;
    native public fun u128_max(): u128;
    native public fun u64_max(): u64;

}
