module 0x1::CoreAddresses {

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun ASSOCIATION_ROOT_ADDRESS(): address;
    native public fun GENESIS_ADDRESS(): address;
    native public fun VM_RESERVED_ADDRESS(): address;
    native public fun assert_genesis_address(a0: &signer);

}
