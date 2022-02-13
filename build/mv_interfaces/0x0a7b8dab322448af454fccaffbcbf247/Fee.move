module 0xA7B8DAB322448AF454FCCAFFBCBF247::Fee {

    struct Fee has store, key {
        feeOn: bool,
        feeTo: address,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun get_fee(): (bool, address);
    native public fun init_fee(a0: &signer);
    native public fun update_fee_on(a0: &signer, a1: bool);
    native public fun update_fee_to(a0: &signer, a1: address);

}
