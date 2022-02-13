module 0x1::Timestamp {

    struct CurrentTimeMilliseconds has key {
        milliseconds: u64,
    }
    struct TimeHasStarted has key {
        dummy_field: bool,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun assert_genesis();
    native public fun initialize(a0: &signer, a1: u64);
    native public fun is_genesis(): bool;
    native public fun now_milliseconds(): u64;
    native public fun now_seconds(): u64;
    native public fun set_time_has_started(a0: &signer);
    native public fun update_global_time(a0: &signer, a1: u64);

}
