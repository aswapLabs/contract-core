module 0x1::STC {

    use 0x1::STC;
    use 0x1::Token;
    use 0x1::Treasury;

    struct STC has copy, drop, store {
        dummy_field: bool,
    }
    struct SharedBurnCapability has store, key {
        cap: Token::BurnCapability<STC::STC>,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun burn(a0: Token::Token<STC::STC>);
    native public fun initialize(a0: &signer, a1: u64, a2: u64, a3: u8, a4: u64);
    native public fun initialize_v2(a0: &signer, a1: u128, a2: u64, a3: u64, a4: u8, a5: u64): Treasury::WithdrawCapability<STC::STC>;
    native public fun is_stc<T0: store>(): bool;
    native public fun token_address(): address;
    native public fun upgrade_from_v1_to_v2(a0: &signer, a1: u128): Treasury::WithdrawCapability<STC::STC>;

}
