module 0x1::SharedEd25519PublicKey {

    use 0x1::Account;

    struct SharedEd25519PublicKey has key {
        key: vector<u8>,
        rotation_cap: Account::KeyRotationCapability,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun exists_at(a0: address): bool;
    native public fun key(a0: address): vector<u8>;
    native public fun publish(a0: &signer, a1: vector<u8>);
    native public fun rotate_key(a0: &signer, a1: vector<u8>);

}
