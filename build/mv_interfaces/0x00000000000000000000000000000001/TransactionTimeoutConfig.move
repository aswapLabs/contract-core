module 0x1::TransactionTimeoutConfig {

    use 0x1::TransactionTimeoutConfig;

    struct TransactionTimeoutConfig has copy, drop, store {
        duration_seconds: u64,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun duration_seconds(): u64;
    native public fun get_transaction_timeout_config(): TransactionTimeoutConfig::TransactionTimeoutConfig;
    native public fun initialize(a0: &signer, a1: u64);
    native public fun new_transaction_timeout_config(a0: u64): TransactionTimeoutConfig::TransactionTimeoutConfig;

}
