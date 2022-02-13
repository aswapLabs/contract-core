module 0x1::Hash {

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun keccak_256(a0: vector<u8>): vector<u8>;
    native public fun ripemd160(a0: vector<u8>): vector<u8>;
    native public fun sha2_256(a0: vector<u8>): vector<u8>;
    native public fun sha3_256(a0: vector<u8>): vector<u8>;

}
