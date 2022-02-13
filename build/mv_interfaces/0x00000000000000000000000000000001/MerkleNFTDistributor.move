module 0x1::MerkleNFTDistributor {

    use 0x1::NFT;

    struct MerkleNFTDistribution<T0: copy+ drop+ store> has key {
        merkle_root: vector<u8>,
        claimed_bitmap: vector<u128>,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun is_minted<T0: copy+ drop+ store>(a0: address, a1: u64): bool;
    native public fun mint_with_cap<T0: copy+ drop+ store, T1: store, T2: copy+ drop+ store>(a0: &signer, a1: &mut NFT::MintCapability<T0>, a2: address, a3: u64, a4: NFT::Metadata, a5: T0, a6: T1, a7: vector<vector<u8>>): NFT::NFT<T0, T1>;
    native public fun register<T0: copy+ drop+ store, T1: copy+ drop+ store>(a0: &signer, a1: vector<u8>, a2: u64, a3: T1, a4: NFT::Metadata): NFT::MintCapability<T0>;
    native public fun verify_proof<T0: copy+ drop+ store>(a0: address, a1: address, a2: u64, a3: vector<vector<u8>>): bool;

}
