module 0x1::OnChainConfigDao {

    use 0x1::Config;

    struct OnChainConfigUpdate<T0: copy+ drop+ store> has copy, drop, store {
        value: T0,
    }
    struct WrappedConfigModifyCapability<T0, T1: copy+ drop+ store> has key {
        cap: Config::ModifyConfigCapability<T1>,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun execute<T0: copy+ drop+ store, T1: copy+ drop+ store>(a0: address, a1: u64);
    native public fun plugin<T0: copy+ drop+ store, T1: copy+ drop+ store>(a0: &signer);
    native public fun propose_update<T0: copy+ drop+ store, T1: copy+ drop+ store>(a0: &signer, a1: T1, a2: u64);

}
