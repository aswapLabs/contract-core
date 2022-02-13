module 0x1::NFT {

    use 0x1::Account;
    use 0x1::Event;
    use 0x1::NFT;

    struct BurnCapability<T0: store> has store, key {
        dummy_field: bool,
    }
    struct BurnEvent<T0: copy+ drop+ store> has drop, store {
        id: u64,
    }
    struct GenesisSignerCapability has key {
        cap: Account::SignerCapability,
    }
    struct Metadata has copy, drop, store {
        name: vector<u8>,
        image: vector<u8>,
        image_data: vector<u8>,
        description: vector<u8>,
    }
    struct MintCapability<T0: store> has store, key {
        dummy_field: bool,
    }
    struct MintEvent<T0: copy+ drop+ store> has drop, store {
        id: u64,
        creator: address,
        base_meta: NFT::Metadata,
        type_meta: T0,
    }
    struct NFT<T0: copy+ drop+ store, T1> has store {
        creator: address,
        id: u64,
        base_meta: NFT::Metadata,
        type_meta: T0,
        body: T1,
    }
    struct NFTInfo<T0: copy+ drop+ store> has copy, drop, store {
        id: u64,
        creator: address,
        base_meta: NFT::Metadata,
        type_meta: T0,
    }
    struct NFTTypeInfo<T0: copy+ drop+ store, T1: copy+ drop+ store> has store, key {
        counter: u64,
        meta: NFT::Metadata,
        info: T1,
        mint_events: Event::EventHandle<NFT::MintEvent<T0>>,
    }
    struct NFTTypeInfoCompat<T0: copy+ drop+ store, T1: copy+ drop+ store> has key {
        info: T1,
    }
    struct NFTTypeInfoV2<T0: copy+ drop+ store> has store, key {
        register: address,
        counter: u64,
        meta: NFT::Metadata,
        mint_events: Event::EventHandle<NFT::MintEvent<T0>>,
        burn_events: Event::EventHandle<NFT::BurnEvent<T0>>,
    }
    struct UpdateCapability<T0: store> has store, key {
        dummy_field: bool,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun add_burn_capability<T0: copy+ drop+ store>(a0: &signer, a1: NFT::BurnCapability<T0>);
    native public fun add_mint_capability<T0: copy+ drop+ store>(a0: &signer, a1: NFT::MintCapability<T0>);
    native public fun add_update_capability<T0: copy+ drop+ store>(a0: &signer, a1: NFT::UpdateCapability<T0>);
    native public fun borrow_body<T0: copy+ drop+ store, T1: store>(a0: &NFT::NFT<T0, T1>): &T1;
    native public fun borrow_body_mut_with_cap<T0: copy+ drop+ store, T1: store>(a0: &mut NFT::UpdateCapability<T0>, a1: &mut NFT::NFT<T0, T1>): &mut T1;
    native public fun burn<T0: copy+ drop+ store, T1: store>(a0: &signer, a1: NFT::NFT<T0, T1>): T1;
    native public fun burn_with_cap<T0: copy+ drop+ store, T1: store>(a0: &mut NFT::BurnCapability<T0>, a1: NFT::NFT<T0, T1>): T1;
    native public fun destroy_burn_capability<T0: copy+ drop+ store>(a0: NFT::BurnCapability<T0>);
    native public fun destroy_mint_capability<T0: copy+ drop+ store>(a0: NFT::MintCapability<T0>);
    native public fun destroy_update_capability<T0: copy+ drop+ store>(a0: NFT::UpdateCapability<T0>);
    native public fun empty_meta(): NFT::Metadata;
    native public fun extract_signer_cap(a0: &signer): Account::SignerCapability;
    native public fun get_base_meta<T0: copy+ drop+ store, T1: store>(a0: &NFT::NFT<T0, T1>): &NFT::Metadata;
    native public fun get_creator<T0: copy+ drop+ store, T1: store>(a0: &NFT::NFT<T0, T1>): address;
    native public fun get_id<T0: copy+ drop+ store, T1: store>(a0: &NFT::NFT<T0, T1>): u64;
    native public fun get_info<T0: copy+ drop+ store, T1: store>(a0: &NFT::NFT<T0, T1>): NFT::NFTInfo<T0>;
    native public fun get_type_meta<T0: copy+ drop+ store, T1: store>(a0: &NFT::NFT<T0, T1>): &T0;
    native public fun initialize(a0: &signer);
    native public fun is_register<T0: copy+ drop+ store>(): bool;
    native public fun meta_description(a0: &NFT::Metadata): vector<u8>;
    native public fun meta_image(a0: &NFT::Metadata): vector<u8>;
    native public fun meta_image_data(a0: &NFT::Metadata): vector<u8>;
    native public fun meta_name(a0: &NFT::Metadata): vector<u8>;
    native public fun mint<T0: copy+ drop+ store, T1: store, T2: copy+ drop+ store>(a0: &signer, a1: NFT::Metadata, a2: T0, a3: T1): NFT::NFT<T0, T1>;
    native public fun mint_v2<T0: copy+ drop+ store, T1: store>(a0: &signer, a1: NFT::Metadata, a2: T0, a3: T1): NFT::NFT<T0, T1>;
    native public fun mint_with_cap<T0: copy+ drop+ store, T1: store, T2: copy+ drop+ store>(a0: address, a1: &mut NFT::MintCapability<T0>, a2: NFT::Metadata, a3: T0, a4: T1): NFT::NFT<T0, T1>;
    native public fun mint_with_cap_v2<T0: copy+ drop+ store, T1: store>(a0: address, a1: &mut NFT::MintCapability<T0>, a2: NFT::Metadata, a3: T0, a4: T1): NFT::NFT<T0, T1>;
    native public fun new_meta(a0: vector<u8>, a1: vector<u8>): NFT::Metadata;
    native public fun new_meta_with_image(a0: vector<u8>, a1: vector<u8>, a2: vector<u8>): NFT::Metadata;
    native public fun new_meta_with_image_data(a0: vector<u8>, a1: vector<u8>, a2: vector<u8>): NFT::Metadata;
    native public fun nft_type_info_counter<T0: copy+ drop+ store, T1: copy+ drop+ store>(): u64;
    native public fun nft_type_info_counter_v2<T0: copy+ drop+ store>(): u64;
    native public fun nft_type_info_ex_info<T0: copy+ drop+ store, T1: copy+ drop+ store>(): T1;
    native public fun nft_type_info_meta<T0: copy+ drop+ store>(): NFT::Metadata;
    native public fun register<T0: copy+ drop+ store, T1: copy+ drop+ store>(a0: &signer, a1: T1, a2: NFT::Metadata);
    native public fun register_v2<T0: copy+ drop+ store>(a0: &signer, a1: NFT::Metadata);
    native public fun remove_burn_capability<T0: copy+ drop+ store>(a0: &signer): NFT::BurnCapability<T0>;
    native public fun remove_compat_info<T0: copy+ drop+ store, T1: copy+ drop+ store>(a0: &mut NFT::MintCapability<T0>): T1;
    native public fun remove_mint_capability<T0: copy+ drop+ store>(a0: &signer): NFT::MintCapability<T0>;
    native public fun remove_update_capability<T0: copy+ drop+ store>(a0: &signer): NFT::UpdateCapability<T0>;
    native public fun unpack_info<T0: copy+ drop+ store>(a0: NFT::NFTInfo<T0>): (u64, address, NFT::Metadata, T0);
    native public fun update_meta<T0: copy+ drop+ store, T1: store>(a0: &signer, a1: &mut NFT::NFT<T0, T1>, a2: NFT::Metadata, a3: T0);
    native public fun update_meta_with_cap<T0: copy+ drop+ store, T1: store>(a0: &mut NFT::UpdateCapability<T0>, a1: &mut NFT::NFT<T0, T1>, a2: NFT::Metadata, a3: T0);
    native public fun update_nft_type_info_meta<T0: copy+ drop+ store, T1: store>(a0: &signer, a1: NFT::Metadata);
    native public fun update_nft_type_info_meta_with_cap<T0: copy+ drop+ store>(a0: &mut NFT::UpdateCapability<T0>, a1: NFT::Metadata);
    native public fun upgrade_nft_type_info_from_v1_to_v2<T0: copy+ drop+ store, T1: copy+ drop+ store>(a0: &signer, a1: &mut NFT::MintCapability<T0>);

}
