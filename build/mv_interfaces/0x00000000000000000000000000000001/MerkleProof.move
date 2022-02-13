module 0x1::MerkleProof {

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun verify(a0: &vector<vector<u8>>, a1: &vector<u8>, a2: vector<u8>): bool;

}
