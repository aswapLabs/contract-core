module 0xA7B8DAB322448AF454FCCAFFBCBF247::Factory {

    use 0x1::Token;
    use 0xA7B8DAB322448AF454FCCAFFBCBF247::Factory;

    struct Pairs has store, key {
        pair: vector<Factory::PairsTokenCode>,
    }
    struct PairsTokenCode has copy, drop, store {
        tokencode_x: Token::TokenCode,
        token_x_precision: u128,
        tokencode_y: Token::TokenCode,
        token_y_precision: u128,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun all_pairs(): vector<Factory::PairsTokenCode>;
    native public fun all_pairs_length(): u64;
    native public fun create_pair<T0: store, T1: store>(a0: &signer);
    native public(script) fun init(a0: signer);

}
