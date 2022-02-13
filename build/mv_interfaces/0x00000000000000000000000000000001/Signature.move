module 0x1::Signature {

    use 0x1::EVMAddress;
    use 0x1::Option;

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun ecrecover(a0: vector<u8>, a1: vector<u8>): Option::Option<EVMAddress::EVMAddress>;
    native public fun ed25519_validate_pubkey(a0: vector<u8>): bool;
    native public fun ed25519_verify(a0: vector<u8>, a1: vector<u8>, a2: vector<u8>): bool;

}
