module 0x1::Event {

    use 0x1::Event;

    struct EventHandle<T0: drop+ store> has store {
        counter: u64,
        guid: vector<u8>,
    }
    struct EventHandleGenerator has key {
        counter: u64,
        addr: address,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun destroy_handle<T0: drop+ store>(a0: Event::EventHandle<T0>);
    native public fun emit_event<T0: drop+ store>(a0: &mut Event::EventHandle<T0>, a1: T0);
    native public fun new_event_handle<T0: drop+ store>(a0: &signer): Event::EventHandle<T0>;
    native public fun publish_generator(a0: &signer);

}
