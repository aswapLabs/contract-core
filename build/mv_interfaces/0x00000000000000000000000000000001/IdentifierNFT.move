module 0x1::IdentifierNFT {

    use 0x1::NFT;
    use 0x1::Option;

    struct IdentifierNFT<T0: copy+ drop+ store, T1: store> has key {
        nft: Option::Option<NFT::NFT<T0, T1>>,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun accept<T0: copy+ drop+ store, T1: store>(a0: &signer);
    native public fun destroy_empty<T0: copy+ drop+ store, T1: store>(a0: &signer);
    native public fun get_nft_info<T0: copy+ drop+ store, T1: store>(a0: address): Option::Option<NFT::NFTInfo<T0>>;
    native public fun grant<T0: copy+ drop+ store, T1: store>(a0: &mut NFT::MintCapability<T0>, a1: &signer, a2: NFT::NFT<T0, T1>);
    native public fun grant_to<T0: copy+ drop+ store, T1: store>(a0: &mut NFT::MintCapability<T0>, a1: address, a2: NFT::NFT<T0, T1>);
    native public fun is_accept<T0: copy+ drop+ store, T1: store>(a0: address): bool;
    native public fun is_owns<T0: copy+ drop+ store, T1: store>(a0: address): bool;
    native public fun revoke<T0: copy+ drop+ store, T1: store>(a0: &mut NFT::BurnCapability<T0>, a1: address): NFT::NFT<T0, T1>;

}
