module 0x1::Config {

    use 0x1::Config;
    use 0x1::Event;
    use 0x1::Option;

    struct Config<T0: copy+ drop+ store> has key {
        payload: T0,
    }
    struct ConfigChangeEvent<T0: copy+ drop+ store> has drop, store {
        account_address: address,
        value: T0,
    }
    struct ModifyConfigCapability<T0: copy+ drop+ store> has store {
        account_address: address,
        events: Event::EventHandle<Config::ConfigChangeEvent<T0>>,
    }
    struct ModifyConfigCapabilityHolder<T0: copy+ drop+ store> has store, key {
        cap: Option::Option<Config::ModifyConfigCapability<T0>>,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun account_address<T0: copy+ drop+ store>(a0: &Config::ModifyConfigCapability<T0>): address;
    native public fun config_exist_by_address<T0: copy+ drop+ store>(a0: address): bool;
    native public fun destroy_modify_config_capability<T0: copy+ drop+ store>(a0: Config::ModifyConfigCapability<T0>);
    native public fun extract_modify_config_capability<T0: copy+ drop+ store>(a0: &signer): Config::ModifyConfigCapability<T0>;
    native public fun get_by_address<T0: copy+ drop+ store>(a0: address): T0;
    native public fun publish_new_config<T0: copy+ drop+ store>(a0: &signer, a1: T0);
    native public fun publish_new_config_with_capability<T0: copy+ drop+ store>(a0: &signer, a1: T0): Config::ModifyConfigCapability<T0>;
    native public fun restore_modify_config_capability<T0: copy+ drop+ store>(a0: Config::ModifyConfigCapability<T0>);
    native public fun set<T0: copy+ drop+ store>(a0: &signer, a1: T0);
    native public fun set_with_capability<T0: copy+ drop+ store>(a0: &mut Config::ModifyConfigCapability<T0>, a1: T0);

}
