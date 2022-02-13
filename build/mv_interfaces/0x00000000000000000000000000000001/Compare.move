module 0x1::Compare {

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun cmp_bcs_bytes(a0: &vector<u8>, a1: &vector<u8>): u8;
    native public fun cmp_bytes(a0: &vector<u8>, a1: &vector<u8>): u8;

}
