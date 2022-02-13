module 0x1::PriceOracle {

    use 0x1::Oracle;

    struct PriceOracleInfo has copy, drop, store {
        scaling_factor: u128,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun get_scaling_factor<T0: copy+ drop+ store>(): u128;
    native public fun init_data_source<T0: copy+ drop+ store>(a0: &signer, a1: u128);
    native public fun is_data_source_initialized<T0: copy+ drop+ store>(a0: address): bool;
    native public fun read<T0: copy+ drop+ store>(a0: address): u128;
    native public fun read_record<T0: copy+ drop+ store>(a0: address): Oracle::DataRecord<u128>;
    native public fun read_records<T0: copy+ drop+ store>(a0: &vector<address>): vector<Oracle::DataRecord<u128>>;
    native public fun register_oracle<T0: copy+ drop+ store>(a0: &signer, a1: u8);
    native public fun update<T0: copy+ drop+ store>(a0: &signer, a1: u128);
    native public fun update_with_cap<T0: copy+ drop+ store>(a0: &mut Oracle::UpdateCapability<T0>, a1: u128);

}
