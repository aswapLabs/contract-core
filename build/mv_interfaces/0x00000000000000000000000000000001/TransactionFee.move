module 0x1::TransactionFee {

    use 0x1::Token;

    struct TransactionFee<T0> has key {
        fee: Token::Token<T0>,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun distribute_transaction_fees<T0: store>(a0: &signer): Token::Token<T0>;
    native public fun initialize(a0: &signer);
    native public fun pay_fee<T0: store>(a0: Token::Token<T0>);

}
