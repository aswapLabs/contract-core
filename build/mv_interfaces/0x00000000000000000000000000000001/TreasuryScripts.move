module 0x1::TreasuryScripts {

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public(script) fun execute_withdraw_proposal<T0: copy+ drop+ store>(a0: signer, a1: address, a2: u64);
    native public(script) fun propose_withdraw<T0: copy+ drop+ store>(a0: signer, a1: address, a2: u128, a3: u64, a4: u64);
    native public(script) fun withdraw_and_split_lt_withdraw_cap<T0: store>(a0: signer, a1: address, a2: u128, a3: u64);
    native public(script) fun withdraw_token_with_linear_withdraw_capability<T0: store>(a0: signer);

}
