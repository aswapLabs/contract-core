module 0x1::DaoVoteScripts {

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public(script) fun cast_vote<T0: copy+ drop+ store, T1: copy+ drop+ store>(a0: signer, a1: address, a2: u64, a3: bool, a4: u128);
    native public(script) fun flip_vote<T0: copy+ drop+ store, T1: copy+ drop+ store>(a0: signer, a1: address, a2: u64);
    native public(script) fun revoke_vote<T0: copy+ drop+ store, T1: copy+ drop+ store>(a0: signer, a1: address, a2: u64);
    native public(script) fun revoke_vote_of_power<T0: copy+ drop+ store, T1: copy+ drop+ store>(a0: signer, a1: address, a2: u64, a3: u128);
    native public(script) fun unstake_vote<T0: copy+ drop+ store, T1: copy+ drop+ store>(a0: signer, a1: address, a2: u64);

}
