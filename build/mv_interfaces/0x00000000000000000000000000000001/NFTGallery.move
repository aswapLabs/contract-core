module 0x1::NFTGallery {

    use 0x1::Event;
    use 0x1::NFT;
    use 0x1::NFTGallery;
    use 0x1::Option;

    struct DepositEvent<T0: copy+ drop+ store> has drop, store {
        owner: address,
        id: u64,
    }
    struct NFTGallery<T0: copy+ drop+ store, T1: store> has store, key {
        withdraw_events: Event::EventHandle<NFTGallery::WithdrawEvent<T0>>,
        deposit_events: Event::EventHandle<NFTGallery::DepositEvent<T0>>,
        items: vector<NFT::NFT<T0, T1>>,
    }
    struct WithdrawEvent<T0: copy+ drop+ store> has drop, store {
        owner: address,
        id: u64,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun accept<T0: copy+ drop+ store, T1: store>(a0: &signer);
    native public fun count_of<T0: copy+ drop+ store, T1: store>(a0: address): u64;
    native public fun deposit<T0: copy+ drop+ store, T1: store>(a0: &signer, a1: NFT::NFT<T0, T1>);
    native public fun deposit_to<T0: copy+ drop+ store, T1: store>(a0: address, a1: NFT::NFT<T0, T1>);
    native public fun get_nft_info_by_id<T0: copy+ drop+ store, T1: store>(a0: address, a1: u64): Option::Option<NFT::NFTInfo<T0>>;
    native public fun get_nft_info_by_idx<T0: copy+ drop+ store, T1: store>(a0: address, a1: u64): NFT::NFTInfo<T0>;
    native public fun get_nft_infos<T0: copy+ drop+ store, T1: store>(a0: address): vector<NFT::NFTInfo<T0>>;
    native public fun is_accept<T0: copy+ drop+ store, T1: store>(a0: address): bool;
    native public fun transfer<T0: copy+ drop+ store, T1: store>(a0: &signer, a1: u64, a2: address);
    native public fun withdraw<T0: copy+ drop+ store, T1: store>(a0: &signer, a1: u64): Option::Option<NFT::NFT<T0, T1>>;
    native public fun withdraw_one<T0: copy+ drop+ store, T1: store>(a0: &signer): NFT::NFT<T0, T1>;

}
