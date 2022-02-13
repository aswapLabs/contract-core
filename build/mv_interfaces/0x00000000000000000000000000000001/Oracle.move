module 0x1::Oracle {

    use 0x1::Account;
    use 0x1::Event;
    use 0x1::Oracle;

    struct DataRecord<T0: copy+ drop+ store> has copy, drop, store {
        version: u64,
        value: T0,
        updated_at: u64,
    }
    struct DataSource<T0: copy+ drop+ store, T1: copy+ drop+ store> has key {
        id: u64,
        counter: u64,
        update_events: Event::EventHandle<Oracle::OracleUpdateEvent<T0, T1>>,
    }
    struct GenesisSignerCapability has key {
        cap: Account::SignerCapability,
    }
    struct OracleFeed<T0: copy+ drop+ store, T1: copy+ drop+ store> has key {
        record: Oracle::DataRecord<T1>,
    }
    struct OracleInfo<T0: copy+ drop+ store, T1: copy+ drop+ store> has key {
        counter: u64,
        info: T1,
    }
    struct OracleUpdateEvent<T0: copy+ drop+ store, T1: copy+ drop+ store> has copy, drop, store {
        source_id: u64,
        record: Oracle::DataRecord<T1>,
    }
    struct UpdateCapability<T0: copy+ drop+ store> has store, key {
        account: address,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun add_update_capability<T0: copy+ drop+ store>(a0: &signer, a1: Oracle::UpdateCapability<T0>);
    native public fun extract_signer_cap(a0: &signer): Account::SignerCapability;
    native public fun get_oracle_counter<T0: copy+ drop+ store, T1: copy+ drop+ store>(): u64;
    native public fun get_oracle_info<T0: copy+ drop+ store, T1: copy+ drop+ store>(): T1;
    native public fun init_data_source<T0: copy+ drop+ store, T1: copy+ drop+ store, T2: copy+ drop+ store>(a0: &signer, a1: T2);
    native public fun initialize(a0: &signer);
    native public fun is_data_source_initialized<T0: copy+ drop+ store, T1: copy+ drop+ store>(a0: address): bool;
    native public fun read<T0: copy+ drop+ store, T1: copy+ drop+ store>(a0: address): T1;
    native public fun read_record<T0: copy+ drop+ store, T1: copy+ drop+ store>(a0: address): Oracle::DataRecord<T1>;
    native public fun read_records<T0: copy+ drop+ store, T1: copy+ drop+ store>(a0: &vector<address>): vector<Oracle::DataRecord<T1>>;
    native public fun register_oracle<T0: copy+ drop+ store, T1: copy+ drop+ store>(a0: &signer, a1: T1);
    native public fun remove_update_capability<T0: copy+ drop+ store>(a0: &signer): Oracle::UpdateCapability<T0>;
    native public fun unpack_record<T0: copy+ drop+ store>(a0: Oracle::DataRecord<T0>): (u64, T0, u64);
    native public fun update<T0: copy+ drop+ store, T1: copy+ drop+ store>(a0: &signer, a1: T1);
    native public fun update_with_cap<T0: copy+ drop+ store, T1: copy+ drop+ store>(a0: &mut Oracle::UpdateCapability<T0>, a1: T1);

}
