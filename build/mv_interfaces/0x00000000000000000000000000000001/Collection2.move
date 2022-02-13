module 0x1::Collection2 {

    use 0x1::Collection2;
    use 0x1::Option;

    struct Collection<T0> {
        items: vector<T0>,
        owner: address,
        can_put: bool,
        can_mut: bool,
        can_take: bool,
    }
    struct CollectionStore<T0: store> has key {
        items: Option::Option<vector<T0>>,
        anyone_can_put: bool,
        anyone_can_mut: bool,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun accept<T0: store>(a0: &signer);
    native public fun append<T0>(a0: &mut Collection2::Collection<T0>, a1: T0);
    native public fun append_all<T0>(a0: &mut Collection2::Collection<T0>, a1: vector<T0>);
    native public fun borrow<T0>(a0: &Collection2::Collection<T0>, a1: u64): &T0;
    native public fun borrow_collection<T0: store>(a0: &signer, a1: address): Collection2::Collection<T0>;
    native public fun borrow_mut<T0>(a0: &mut Collection2::Collection<T0>, a1: u64): &mut T0;
    native public fun create_collection<T0: store>(a0: &signer, a1: bool, a2: bool);
    native public fun destroy_collection<T0: store>(a0: &signer);
    native public fun exists_at<T0: store>(a0: address): bool;
    native public fun is_accept<T0: store>(a0: address): bool;
    native public fun length<T0>(a0: &Collection2::Collection<T0>): u64;
    native public fun length_of<T0: store>(a0: address): u64;
    native public fun pop_back<T0>(a0: &mut Collection2::Collection<T0>): T0;
    native public fun push_back<T0>(a0: &mut Collection2::Collection<T0>, a1: T0);
    native public fun put<T0: store>(a0: &signer, a1: address, a2: T0);
    native public fun put_all<T0: store>(a0: &signer, a1: address, a2: vector<T0>);
    native public fun remove<T0>(a0: &mut Collection2::Collection<T0>, a1: u64): T0;
    native public fun return_collection<T0: store>(a0: Collection2::Collection<T0>);
    native public fun take<T0: store>(a0: &signer): T0;

}
