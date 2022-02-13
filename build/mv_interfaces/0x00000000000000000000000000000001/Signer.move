module 0x1::Signer {

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun address_of(a0: &signer): address;
    native public fun borrow_address(a0: &signer): &address;

}
