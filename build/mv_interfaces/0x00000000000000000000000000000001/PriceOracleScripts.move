module 0x1::PriceOracleScripts {

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public(script) fun init_data_source<T0: copy+ drop+ store>(a0: signer, a1: u128);
    native public(script) fun register_oracle<T0: copy+ drop+ store>(a0: signer, a1: u8);
    native public(script) fun update<T0: copy+ drop+ store>(a0: signer, a1: u128);

}
