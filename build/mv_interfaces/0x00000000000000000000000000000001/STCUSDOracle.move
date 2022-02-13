module 0x1::STCUSDOracle {

    use 0x1::Oracle;

    struct STCUSD has copy, drop, store {
        dummy_field: bool,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun read(a0: address): u128;
    native public fun read_record(a0: address): Oracle::DataRecord<u128>;
    native public fun read_records(a0: &vector<address>): vector<Oracle::DataRecord<u128>>;
    native public fun register(a0: &signer);

}
