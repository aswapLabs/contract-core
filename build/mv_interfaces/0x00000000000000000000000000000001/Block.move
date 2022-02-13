module 0x1::Block {

    use 0x1::Block;
    use 0x1::Event;

    struct BlockMetadata has key {
        number: u64,
        parent_hash: vector<u8>,
        author: address,
        uncles: u64,
        new_block_events: Event::EventHandle<Block::NewBlockEvent>,
    }
    struct NewBlockEvent has drop, store {
        number: u64,
        author: address,
        timestamp: u64,
        uncles: u64,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun get_current_author(): address;
    native public fun get_current_block_number(): u64;
    native public fun get_parent_hash(): vector<u8>;
    native public fun initialize(a0: &signer, a1: vector<u8>);
    native public fun process_block_metadata(a0: &signer, a1: vector<u8>, a2: address, a3: u64, a4: u64, a5: u64);

}
