module 0x1::MintDaoProposal {

    use 0x1::Token;

    struct MintToken has copy, drop, store {
        receiver: address,
        amount: u128,
    }
    struct WrappedMintCapability<T0> has key {
        cap: Token::MintCapability<T0>,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun execute_mint_proposal<T0: copy+ drop+ store>(a0: address, a1: u64);
    native public fun plugin<T0: store>(a0: &signer);
    native public fun propose_mint_to<T0: copy+ drop+ store>(a0: &signer, a1: address, a2: u128, a3: u64);

}
