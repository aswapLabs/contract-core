module 0x1::Vector {

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun append<T0>(a0: &mut vector<T0>, a1: vector<T0>);
    native public fun borrow<T0>(a0: &vector<T0>, a1: u64): &T0;
    native public fun borrow_mut<T0>(a0: &mut vector<T0>, a1: u64): &mut T0;
    native public fun contains<T0>(a0: &vector<T0>, a1: &T0): bool;
    native public fun destroy_empty<T0>(a0: vector<T0>);
    native public fun empty<T0>(): vector<T0>;
    native public fun index_of<T0>(a0: &vector<T0>, a1: &T0): (bool, u64);
    native public fun is_empty<T0>(a0: &vector<T0>): bool;
    native public fun length<T0>(a0: &vector<T0>): u64;
    native public fun pop_back<T0>(a0: &mut vector<T0>): T0;
    native public fun push_back<T0>(a0: &mut vector<T0>, a1: T0);
    native public fun remove<T0>(a0: &mut vector<T0>, a1: u64): T0;
    native public fun reverse<T0>(a0: &mut vector<T0>);
    native public fun singleton<T0>(a0: T0): vector<T0>;
    native public fun split<T0: copy+ drop+ store>(a0: &vector<T0>, a1: u64): vector<vector<T0>>;
    native public fun swap<T0>(a0: &mut vector<T0>, a1: u64, a2: u64);
    native public fun swap_remove<T0>(a0: &mut vector<T0>, a1: u64): T0;

}
