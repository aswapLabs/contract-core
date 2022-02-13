module 0x1::Treasury {

    use 0x1::Event;
    use 0x1::Token;
    use 0x1::Treasury;

    struct DepositEvent has drop, store {
        amount: u128,
    }
    struct LinearWithdrawCapability<T0> has store, key {
        total: u128,
        withdraw: u128,
        start_time: u64,
        period: u64,
    }
    struct Treasury<T0> has store, key {
        balance: Token::Token<T0>,
        withdraw_events: Event::EventHandle<Treasury::WithdrawEvent>,
        deposit_events: Event::EventHandle<Treasury::DepositEvent>,
    }
    struct WithdrawCapability<T0> has store, key {
        dummy_field: bool,
    }
    struct WithdrawEvent has drop, store {
        amount: u128,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun add_linear_withdraw_capability<T0: store>(a0: &signer, a1: Treasury::LinearWithdrawCapability<T0>);
    native public fun add_withdraw_capability<T0: store>(a0: &signer, a1: Treasury::WithdrawCapability<T0>);
    native public fun balance<T0: store>(): u128;
    native public fun deposit<T0: store>(a0: Token::Token<T0>);
    native public fun destroy_linear_withdraw_capability<T0: store>(a0: Treasury::LinearWithdrawCapability<T0>);
    native public fun destroy_withdraw_capability<T0: store>(a0: Treasury::WithdrawCapability<T0>);
    native public fun exists_at<T0: store>(): bool;
    native public fun get_linear_withdraw_capability_period<T0: store>(a0: &Treasury::LinearWithdrawCapability<T0>): u64;
    native public fun get_linear_withdraw_capability_start_time<T0: store>(a0: &Treasury::LinearWithdrawCapability<T0>): u64;
    native public fun get_linear_withdraw_capability_total<T0: store>(a0: &Treasury::LinearWithdrawCapability<T0>): u128;
    native public fun get_linear_withdraw_capability_withdraw<T0: store>(a0: &Treasury::LinearWithdrawCapability<T0>): u128;
    native public fun initialize<T0: store>(a0: &signer, a1: Token::Token<T0>): Treasury::WithdrawCapability<T0>;
    native public fun is_empty_linear_withdraw_cap<T0: store>(a0: &Treasury::LinearWithdrawCapability<T0>): bool;
    native public fun is_empty_linear_withdraw_capability<T0: store>(a0: &Treasury::LinearWithdrawCapability<T0>): bool;
    native public fun issue_linear_withdraw_capability<T0: store>(a0: &mut Treasury::WithdrawCapability<T0>, a1: u128, a2: u64): Treasury::LinearWithdrawCapability<T0>;
    native public fun remove_linear_withdraw_capability<T0: store>(a0: &signer): Treasury::LinearWithdrawCapability<T0>;
    native public fun remove_withdraw_capability<T0: store>(a0: &signer): Treasury::WithdrawCapability<T0>;
    native public fun split_linear_withdraw_cap<T0: store>(a0: &mut Treasury::LinearWithdrawCapability<T0>, a1: u128): (Token::Token<T0>, Treasury::LinearWithdrawCapability<T0>);
    native public fun withdraw<T0: store>(a0: &signer, a1: u128): Token::Token<T0>;
    native public fun withdraw_amount_of_linear_cap<T0: store>(a0: &Treasury::LinearWithdrawCapability<T0>): u128;
    native public fun withdraw_by_linear<T0: store>(a0: &signer): Token::Token<T0>;
    native public fun withdraw_with_capability<T0: store>(a0: &mut Treasury::WithdrawCapability<T0>, a1: u128): Token::Token<T0>;
    native public fun withdraw_with_linear_capability<T0: store>(a0: &mut Treasury::LinearWithdrawCapability<T0>): Token::Token<T0>;

}
