module 0x1::EVMAddress {

    use 0x1::EVMAddress;

    struct EVMAddress has copy, drop, store {
        bytes: vector<u8>,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun as_bytes(a0: &EVMAddress::EVMAddress): &vector<u8>;
    native public fun into_bytes(a0: EVMAddress::EVMAddress): vector<u8>;
    native public fun new(a0: vector<u8>): EVMAddress::EVMAddress;

}
