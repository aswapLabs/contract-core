module 0x1::DummyToken {

    use 0x1::DummyToken;
    use 0x1::Token;

    struct DummyToken has copy, drop, store {
        dummy_field: bool,
    }
    struct SharedBurnCapability has key {
        cap: Token::BurnCapability<DummyToken::DummyToken>,
    }
    struct SharedMintCapability has store, key {
        cap: Token::MintCapability<DummyToken::DummyToken>,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun burn(a0: Token::Token<DummyToken::DummyToken>);
    native public fun initialize(a0: &signer);
    native public fun is_dummy_token<T0: store>(): bool;
    native public fun mint(a0: &signer, a1: u128): Token::Token<DummyToken::DummyToken>;
    native public fun token_address(): address;

}
