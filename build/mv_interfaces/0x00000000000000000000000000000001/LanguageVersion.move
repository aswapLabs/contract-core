module 0x1::LanguageVersion {

    use 0x1::LanguageVersion;

    struct LanguageVersion has copy, drop, store {
        major: u64,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun new(a0: u64): LanguageVersion::LanguageVersion;
    native public fun version(a0: &LanguageVersion::LanguageVersion): u64;

}
