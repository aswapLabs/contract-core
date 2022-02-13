module 0x1::TreasuryWithdrawDaoProposal {

    use 0x1::Token;
    use 0x1::Treasury;

    struct WithdrawToken has copy, drop, store {
        receiver: address,
        amount: u128,
        period: u64,
    }
    struct WrappedWithdrawCapability<T0> has key {
        cap: Treasury::WithdrawCapability<T0>,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun execute_withdraw_proposal<T0: copy+ drop+ store>(a0: &signer, a1: address, a2: u64);
    native public fun plugin<T0: store>(a0: &signer, a1: Treasury::WithdrawCapability<T0>);
    native public fun propose_withdraw<T0: copy+ drop+ store>(a0: &signer, a1: address, a2: u128, a3: u64, a4: u64);
    native public fun withdraw_for_block_reward<T0: store>(a0: &signer, a1: u128): Token::Token<T0>;

}
