module 0x1::Option {

    use 0x1::Option;

    struct Option<T0> has copy, drop, store {
        vec: vector<T0>,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun borrow<T0>(a0: &Option::Option<T0>): &T0;
    native public fun borrow_mut<T0>(a0: &mut Option::Option<T0>): &mut T0;
    native public fun borrow_with_default<T0>(a0: &Option::Option<T0>, a1: &T0): &T0;
    native public fun contains<T0>(a0: &Option::Option<T0>, a1: &T0): bool;
    native public fun destroy_none<T0>(a0: Option::Option<T0>);
    native public fun destroy_some<T0>(a0: Option::Option<T0>): T0;
    native public fun destroy_with_default<T0: drop>(a0: Option::Option<T0>, a1: T0): T0;
    native public fun extract<T0>(a0: &mut Option::Option<T0>): T0;
    native public fun fill<T0>(a0: &mut Option::Option<T0>, a1: T0);
    native public fun get_with_default<T0: copy+ drop>(a0: &Option::Option<T0>, a1: T0): T0;
    native public fun is_none<T0>(a0: &Option::Option<T0>): bool;
    native public fun is_some<T0>(a0: &Option::Option<T0>): bool;
    native public fun none<T0>(): Option::Option<T0>;
    native public fun some<T0>(a0: T0): Option::Option<T0>;
    native public fun swap<T0>(a0: &mut Option::Option<T0>, a1: T0): T0;

}
