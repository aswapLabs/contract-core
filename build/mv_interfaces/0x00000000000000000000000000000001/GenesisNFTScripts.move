module 0x1::GenesisNFTScripts {

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public(script) fun mint(a0: signer, a1: u64, a2: vector<vector<u8>>);

}
