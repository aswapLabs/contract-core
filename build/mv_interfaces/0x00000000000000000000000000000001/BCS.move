module 0x1::BCS {

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun to_address(a0: vector<u8>): address;
    native public fun to_bytes<T0: store>(a0: &T0): vector<u8>;

}
