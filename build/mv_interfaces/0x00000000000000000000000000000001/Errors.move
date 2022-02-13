module 0x1::Errors {

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun already_published(a0: u64): u64;
    native public fun custom(a0: u64): u64;
    native public fun deprecated(a0: u64): u64;
    native public fun internal(a0: u64): u64;
    native public fun invalid_argument(a0: u64): u64;
    native public fun invalid_state(a0: u64): u64;
    native public fun limit_exceeded(a0: u64): u64;
    native public fun not_published(a0: u64): u64;
    native public fun requires_address(a0: u64): u64;
    native public fun requires_capability(a0: u64): u64;
    native public fun requires_role(a0: u64): u64;

}
