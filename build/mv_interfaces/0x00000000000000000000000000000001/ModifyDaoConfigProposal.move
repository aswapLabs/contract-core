module 0x1::ModifyDaoConfigProposal {

    use 0x1::Config;
    use 0x1::Dao;

    struct DaoConfigModifyCapability<T0: copy+ drop+ store> has key {
        cap: Config::ModifyConfigCapability<Dao::DaoConfig<T0>>,
    }
    struct DaoConfigUpdate has copy, drop, store {
        voting_delay: u64,
        voting_period: u64,
        voting_quorum_rate: u8,
        min_action_delay: u64,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public(script) fun execute<T0: copy+ drop+ store>(a0: address, a1: u64);
    native public fun plugin<T0: copy+ drop+ store>(a0: &signer);
    native public(script) fun propose<T0: copy+ drop+ store>(a0: signer, a1: u64, a2: u64, a3: u8, a4: u64, a5: u64);

}
