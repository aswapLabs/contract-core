module 0x1::TransferScripts {

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public(script) fun batch_peer_to_peer<T0: store>(a0: signer, a1: vector<address>, a2: vector<vector<u8>>, a3: vector<u128>);
    native public(script) fun batch_peer_to_peer_v2<T0: store>(a0: signer, a1: vector<address>, a2: vector<u128>);
    native public(script) fun peer_to_peer<T0: store>(a0: signer, a1: address, a2: vector<u8>, a3: u128);
    native public(script) fun peer_to_peer_batch<T0: store>(a0: signer, a1: vector<u8>, a2: vector<u8>, a3: u128);
    native public(script) fun peer_to_peer_v2<T0: store>(a0: signer, a1: address, a2: u128);
    native public(script) fun peer_to_peer_with_metadata<T0: store>(a0: signer, a1: address, a2: vector<u8>, a3: u128, a4: vector<u8>);
    native public(script) fun peer_to_peer_with_metadata_v2<T0: store>(a0: signer, a1: address, a2: u128, a3: vector<u8>);

}
