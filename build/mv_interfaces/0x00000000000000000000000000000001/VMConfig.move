module 0x1::VMConfig {

    use 0x1::VMConfig;

    struct GasConstants has copy, drop, store {
        global_memory_per_byte_cost: u64,
        global_memory_per_byte_write_cost: u64,
        min_transaction_gas_units: u64,
        large_transaction_cutoff: u64,
        instrinsic_gas_per_byte: u64,
        maximum_number_of_gas_units: u64,
        min_price_per_gas_unit: u64,
        max_price_per_gas_unit: u64,
        max_transaction_size_in_bytes: u64,
        gas_unit_scaling_factor: u64,
        default_account_size: u64,
    }
    struct GasCost has copy, drop, store {
        instruction_gas: u64,
        memory_gas: u64,
    }
    struct GasSchedule has copy, drop, store {
        instruction_schedule: vector<u8>,
        native_schedule: vector<u8>,
        gas_constants: VMConfig::GasConstants,
    }
    struct VMConfig has copy, drop, store {
        gas_schedule: VMConfig::GasSchedule,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun gas_constants(): VMConfig::GasConstants;
    native public fun initialize(a0: &signer, a1: vector<u8>, a2: vector<u8>, a3: u64, a4: u64, a5: u64, a6: u64, a7: u64, a8: u64, a9: u64, a10: u64, a11: u64, a12: u64, a13: u64);
    native public fun instruction_schedule(): vector<VMConfig::GasCost>;
    native public fun native_schedule(): vector<VMConfig::GasCost>;
    native public fun new_vm_config(a0: vector<u8>, a1: vector<u8>, a2: u64, a3: u64, a4: u64, a5: u64, a6: u64, a7: u64, a8: u64, a9: u64, a10: u64, a11: u64, a12: u64): VMConfig::VMConfig;

}
