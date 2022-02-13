module 0x1::Authenticator {

    use 0x1::Authenticator;

    struct MultiEd25519PublicKey has copy, drop, store {
        public_keys: vector<vector<u8>>,
        threshold: u8,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun create_multi_ed25519(a0: vector<vector<u8>>, a1: u8): Authenticator::MultiEd25519PublicKey;
    native public fun derived_address(a0: vector<u8>): address;
    native public fun ed25519_authentication_key(a0: vector<u8>): vector<u8>;
    native public fun multi_ed25519_authentication_key(a0: &Authenticator::MultiEd25519PublicKey): vector<u8>;
    native public fun public_keys(a0: &Authenticator::MultiEd25519PublicKey): &vector<vector<u8>>;
    native public fun threshold(a0: &Authenticator::MultiEd25519PublicKey): u8;

}
