module 0x1::U256 {

    use 0x1::U256;

    struct U256 has copy, drop, store {
        bits: vector<u64>,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun add(a0: U256::U256, a1: U256::U256): U256::U256;
    native public fun compare(a0: &U256::U256, a1: &U256::U256): u8;
    native public fun div(a0: U256::U256, a1: U256::U256): U256::U256;
    native public fun from_big_endian(a0: vector<u8>): U256::U256;
    native public fun from_little_endian(a0: vector<u8>): U256::U256;
    native public fun from_u128(a0: u128): U256::U256;
    native public fun from_u64(a0: u64): U256::U256;
    native public fun mul(a0: U256::U256, a1: U256::U256): U256::U256;
    native public fun one(): U256::U256;
    native public fun pow(a0: U256::U256, a1: U256::U256): U256::U256;
    native public fun rem(a0: U256::U256, a1: U256::U256): U256::U256;
    native public fun sub(a0: U256::U256, a1: U256::U256): U256::U256;
    native public fun to_u128(a0: &U256::U256): u128;
    native public fun zero(): U256::U256;

}
