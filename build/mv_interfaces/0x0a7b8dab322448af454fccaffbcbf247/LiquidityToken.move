module 0xA7B8DAB322448AF454FCCAFFBCBF247::LiquidityToken {

    use 0x1::Token;
    use 0xA7B8DAB322448AF454FCCAFFBCBF247::LiquidityToken;

    struct LiquidityToken<T0: store, T1: store> has store, key {
        dummy_field: bool,
    }
    struct LiquidityTokenCapability<T0: store, T1: store> has store, key {
        mint: Token::MintCapability<LiquidityToken::LiquidityToken<T0, T1>>,
        burn: Token::BurnCapability<LiquidityToken::LiquidityToken<T0, T1>>,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun burn<T0: store, T1: store>(a0: address, a1: Token::Token<LiquidityToken::LiquidityToken<T0, T1>>);
    native public fun burn_with_capability<T0: store, T1: store>(a0: address, a1: Token::Token<LiquidityToken::LiquidityToken<T0, T1>>);
    native public fun liquidity_token_exists<T0: store, T1: store>(a0: address): bool;
    native public fun mint<T0: store, T1: store>(a0: address, a1: u128): Token::Token<LiquidityToken::LiquidityToken<T0, T1>>;
    native public fun mint_with_capability<T0: store, T1: store>(a0: address, a1: u128): Token::Token<LiquidityToken::LiquidityToken<T0, T1>>;
    native public fun register_liquidity_token<T0: store, T1: store>(a0: &signer);
    native public fun token_address<T0: store, T1: store>(): address;

}
