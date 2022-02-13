module 0xA7B8DAB322448AF454FCCAFFBCBF247::Token2 {

    struct Token2 has store, key {
        dummy_field: bool,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public(script) fun do_init(a0: signer);
    native public(script) fun get_balance(a0: signer): u128;
    native public fun get_balance_cli(a0: &signer): u128;
    native public fun init(a0: signer);
    native public fun init_cli(a0: &signer);
    native public fun is_token1<T0: store>(): bool;
    native public(script) fun mint_token(a0: signer, a1: u128);

}
