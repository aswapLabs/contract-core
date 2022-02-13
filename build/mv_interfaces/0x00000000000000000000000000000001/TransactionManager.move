module 0x1::TransactionManager {

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun block_prologue(a0: signer, a1: vector<u8>, a2: u64, a3: address, a4: vector<u8>, a5: u64, a6: u64, a7: u8, a8: u64);
    native public fun epilogue<T0: store>(a0: signer, a1: address, a2: u64, a3: u64, a4: u64, a5: u64, a6: u8, a7: vector<u8>, a8: address, a9: bool);
    native public fun epilogue_v2<T0: store>(a0: signer, a1: address, a2: u64, a3: vector<u8>, a4: u64, a5: u64, a6: u64, a7: u8, a8: vector<u8>, a9: address, a10: bool);
    native public fun prologue<T0: store>(a0: signer, a1: address, a2: u64, a3: vector<u8>, a4: u64, a5: u64, a6: u64, a7: u8, a8: u8, a9: vector<u8>, a10: address);

}
