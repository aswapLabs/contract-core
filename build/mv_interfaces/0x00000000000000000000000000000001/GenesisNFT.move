module 0x1::GenesisNFT {

    use 0x1::GenesisNFT;
    use 0x1::NFT;
    use 0x1::Option;

    struct GenesisNFT has store {
        dummy_field: bool,
    }
    struct GenesisNFTInfo has copy, drop, store, key {
        merkle_root: vector<u8>,
        total_supply: u64,
    }
    struct GenesisNFTMeta has copy, drop, store {
        index: u64,
    }
    struct GenesisNFTMintCapability has key {
        cap: NFT::MintCapability<GenesisNFT::GenesisNFTMeta>,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun genesis_nft_info(): GenesisNFT::GenesisNFTInfo;
    native public fun get_info(a0: address): Option::Option<NFT::NFTInfo<GenesisNFT::GenesisNFTMeta>>;
    native public fun initialize(a0: &signer, a1: vector<u8>, a2: u64, a3: vector<u8>);
    native public fun is_minted(a0: u64): bool;
    native public fun mint(a0: &signer, a1: u64, a2: vector<vector<u8>>);
    native public fun upgrade_to_nft_type_info_v2(a0: &signer);
    native public fun verify(a0: address, a1: u64, a2: vector<vector<u8>>): bool;

}
