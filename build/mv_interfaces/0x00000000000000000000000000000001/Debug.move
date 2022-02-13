module 0x1::Debug {

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun print<T0: store>(a0: &T0);
    native public fun print_stack_trace();

}
