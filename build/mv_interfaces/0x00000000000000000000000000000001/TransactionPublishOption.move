module 0x1::TransactionPublishOption {

    use 0x1::TransactionPublishOption;

    struct TransactionPublishOption has copy, drop, store {
        script_allowed: bool,
        module_publishing_allowed: bool,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun initialize(a0: &signer, a1: bool, a2: bool);
    native public fun is_module_allowed(a0: address): bool;
    native public fun is_script_allowed(a0: address): bool;
    native public fun new_transaction_publish_option(a0: bool, a1: bool): TransactionPublishOption::TransactionPublishOption;

}
