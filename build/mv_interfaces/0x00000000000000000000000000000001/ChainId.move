module 0x1::ChainId {

    struct ChainId has key {
        id: u8,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun get(): u8;
    native public fun initialize(a0: &signer, a1: u8);
    native public fun is_barnard(): bool;
    native public fun is_dev(): bool;
    native public fun is_halley(): bool;
    native public fun is_main(): bool;
    native public fun is_proxima(): bool;
    native public fun is_test(): bool;

}
