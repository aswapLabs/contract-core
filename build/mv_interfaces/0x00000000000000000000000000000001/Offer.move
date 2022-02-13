module 0x1::Offer {

    struct Offer<T0> has key {
        offered: T0,
        for: address,
        time_lock: u64,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun address_of<T0: store>(a0: address): address;
    native public fun create<T0: store>(a0: &signer, a1: T0, a2: address, a3: u64);
    native public fun exists_at<T0: store>(a0: address): bool;
    native public fun redeem<T0: store>(a0: &signer, a1: address): T0;
    native public(script) fun take_offer<T0: store>(a0: signer, a1: address);

}
