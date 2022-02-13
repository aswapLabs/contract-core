module 0x1::Version {

    use 0x1::Version;

    struct Version has copy, drop, store {
        major: u64,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun get(a0: address): u64;
    native public fun new_version(a0: u64): Version::Version;

}
