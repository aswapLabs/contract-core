module 0x1::OnChainConfigScripts {

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public(script) fun execute_on_chain_config_proposal<T0: copy+ drop+ store>(a0: signer, a1: u64);
    native public(script) fun execute_on_chain_config_proposal_v2<T0: copy+ drop+ store, T1: copy+ drop+ store>(a0: address, a1: u64);
    native public(script) fun propose_update_consensus_config(a0: signer, a1: u64, a2: u64, a3: u128, a4: u64, a5: u64, a6: u64, a7: u64, a8: u64, a9: u64, a10: u64, a11: u8, a12: u64);
    native public(script) fun propose_update_move_language_version(a0: signer, a1: u64, a2: u64);
    native public(script) fun propose_update_reward_config(a0: signer, a1: u64, a2: u64);
    native public(script) fun propose_update_txn_publish_option(a0: signer, a1: bool, a2: bool, a3: u64);
    native public(script) fun propose_update_txn_timeout_config(a0: signer, a1: u64, a2: u64);
    native public(script) fun propose_update_vm_config(a0: signer, a1: vector<u8>, a2: vector<u8>, a3: u64, a4: u64, a5: u64, a6: u64, a7: u64, a8: u64, a9: u64, a10: u64, a11: u64, a12: u64, a13: u64, a14: u64);

}
