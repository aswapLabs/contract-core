module 0xA7B8DAB322448AF454FCCAFFBCBF247::Pair {

    use 0x1::Event;
    use 0x1::Token;
    use 0xA7B8DAB322448AF454FCCAFFBCBF247::LiquidityToken;
    use 0xA7B8DAB322448AF454FCCAFFBCBF247::Pair;

    struct AddLiquidityEvent has drop, store {
        liquidity: u128,
        token_x_code: Token::TokenCode,
        token_y_code: Token::TokenCode,
        addr: address,
        amount_x_desired: u128,
        amount_y_desired: u128,
        amount_x_min: u128,
        amount_y_min: u128,
    }
    struct Pair<T0: store, T1: store> has store, key {
        token_x_pool: Token::Token<T0>,
        token_y_pool: Token::Token<T1>,
        token_x_reserve: u128,
        token_y_reserve: u128,
        last_block_timestamp: u64,
        last_price_x_cumulative: u128,
        last_price_y_cumulative: u128,
        last_k: u128,
        add_liquidity_event: Event::EventHandle<Pair::AddLiquidityEvent>,
        remove_liquidity_event: Event::EventHandle<Pair::RemoveLiquidityEvent>,
        swap_event: Event::EventHandle<Pair::SwapEvent>,
    }
    struct RemoveLiquidityEvent has drop, store {
        liquidity: u128,
        token_x_code: Token::TokenCode,
        token_y_code: Token::TokenCode,
        addr: address,
        amount_x_min: u128,
        amount_y_min: u128,
    }
    struct SwapEvent has drop, store {
        token_x_code: Token::TokenCode,
        token_y_code: Token::TokenCode,
        amount_x_in: u128,
        amount_y_out: u128,
        addr: address,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun burn_liquidity_token<T0: store, T1: store>(a0: Token::Token<LiquidityToken::LiquidityToken<T0, T1>>): (Token::Token<T0>, Token::Token<T1>);
    native public fun emit_add_liquidity_event<T0: store, T1: store>(a0: &signer, a1: u128, a2: u128, a3: u128, a4: u128, a5: u128);
    native public fun emit_remove_liquidity_event<T0: store, T1: store>(a0: &signer, a1: u128, a2: u128, a3: u128);
    native public fun emit_swap_event<T0: store, T1: store>(a0: &signer, a1: u128, a2: u128);
    native public fun get_balances<T0: store, T1: store>(a0: address): (u128, u128);
    native public fun get_reserves<T0: store, T1: store>(): (u128, u128, u64);
    native public fun mint_liquidity_token<T0: store, T1: store>(a0: Token::Token<T0>, a1: Token::Token<T1>): Token::Token<LiquidityToken::LiquidityToken<T0, T1>>;
    native public fun pair_exists<T0: store, T1: store>(): bool;
    native public fun register_pair<T0: store, T1: store>(a0: &signer);
    native public fun swap<T0: store, T1: store>(a0: Token::Token<T0>, a1: u128, a2: Token::Token<T1>, a3: u128): (Token::Token<T0>, Token::Token<T1>);

}
