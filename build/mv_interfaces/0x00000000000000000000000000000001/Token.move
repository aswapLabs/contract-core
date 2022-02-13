module 0x1::Token {

    use 0x1::Event;
    use 0x1::Token;

    struct BurnCapability<T0> has store, key {
        dummy_field: bool,
    }
    struct BurnEvent has drop, store {
        amount: u128,
        token_code: Token::TokenCode,
    }
    struct FixedTimeMintKey<T0> has store, key {
        total: u128,
        end_time: u64,
    }
    struct LinearTimeMintKey<T0> has store, key {
        total: u128,
        minted: u128,
        start_time: u64,
        period: u64,
    }
    struct MintCapability<T0> has store, key {
        dummy_field: bool,
    }
    struct MintEvent has drop, store {
        amount: u128,
        token_code: Token::TokenCode,
    }
    struct Token<T0> has store {
        value: u128,
    }
    struct TokenCode has copy, drop, store {
        addr: address,
        module_name: vector<u8>,
        name: vector<u8>,
    }
    struct TokenInfo<T0> has key {
        total_value: u128,
        scaling_factor: u128,
        mint_events: Event::EventHandle<Token::MintEvent>,
        burn_events: Event::EventHandle<Token::BurnEvent>,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun add_burn_capability<T0: store>(a0: &signer, a1: Token::BurnCapability<T0>);
    native public fun add_mint_capability<T0: store>(a0: &signer, a1: Token::MintCapability<T0>);
    native public fun burn<T0: store>(a0: &signer, a1: Token::Token<T0>);
    native public fun burn_with_capability<T0: store>(a0: &Token::BurnCapability<T0>, a1: Token::Token<T0>);
    native public fun deposit<T0: store>(a0: &mut Token::Token<T0>, a1: Token::Token<T0>);
    native public fun destroy_burn_capability<T0: store>(a0: Token::BurnCapability<T0>);
    native public fun destroy_linear_time_key<T0: store>(a0: Token::LinearTimeMintKey<T0>): (u128, u128, u64, u64);
    native public fun destroy_mint_capability<T0: store>(a0: Token::MintCapability<T0>);
    native public fun destroy_zero<T0: store>(a0: Token::Token<T0>);
    native public fun is_registered_in<T0: store>(a0: address): bool;
    native public fun is_same_token<T0: store, T1: store>(): bool;
    native public fun issue_fixed_mint_key<T0: store>(a0: &Token::MintCapability<T0>, a1: u128, a2: u64): Token::FixedTimeMintKey<T0>;
    native public fun issue_linear_mint_key<T0: store>(a0: &Token::MintCapability<T0>, a1: u128, a2: u64): Token::LinearTimeMintKey<T0>;
    native public fun join<T0: store>(a0: Token::Token<T0>, a1: Token::Token<T0>): Token::Token<T0>;
    native public fun market_cap<T0: store>(): u128;
    native public fun mint<T0: store>(a0: &signer, a1: u128): Token::Token<T0>;
    native public fun mint_with_capability<T0: store>(a0: &Token::MintCapability<T0>, a1: u128): Token::Token<T0>;
    native public fun read_linear_time_key<T0: store>(a0: &Token::LinearTimeMintKey<T0>): (u128, u128, u64, u64);
    native public fun register_token<T0: store>(a0: &signer, a1: u8);
    native public fun remove_burn_capability<T0: store>(a0: &signer): Token::BurnCapability<T0>;
    native public fun remove_mint_capability<T0: store>(a0: &signer): Token::MintCapability<T0>;
    native public fun scaling_factor<T0: store>(): u128;
    native public fun split<T0: store>(a0: Token::Token<T0>, a1: u128): (Token::Token<T0>, Token::Token<T0>);
    native public fun token_address<T0: store>(): address;
    native public fun token_code<T0: store>(): Token::TokenCode;
    native public fun value<T0: store>(a0: &Token::Token<T0>): u128;
    native public fun withdraw<T0: store>(a0: &mut Token::Token<T0>, a1: u128): Token::Token<T0>;
    native public fun zero<T0: store>(): Token::Token<T0>;

}
