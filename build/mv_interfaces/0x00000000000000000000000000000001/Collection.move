module 0x1::Collection {

    use 0x1::Collection;
    use 0x1::Option;

    struct Collection<T0> {
        items: vector<T0>,
        owner: address,
    }
    struct CollectionStore<T0: store> has key {
        items: Option::Option<vector<T0>>,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun borrow<T0>(a0: &Collection::Collection<T0>, a1: u64): &T0;
    native public fun borrow_collection<T0: store>(a0: address): Collection::Collection<T0>;
    native public fun pop_back<T0>(a0: &signer, a1: &mut Collection::Collection<T0>): T0;
    native public fun put<T0: store>(a0: &signer, a1: T0);
    native public fun return_collection<T0: store>(a0: Collection::Collection<T0>);
    native public fun take<T0: store>(a0: &signer): T0;

}
