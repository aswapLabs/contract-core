module 0x1::IdentifierNFTScripts {

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public(script) fun accept<T0: copy+ drop+ store, T1: store>(a0: signer);
    native public(script) fun destroy_empty<T0: copy+ drop+ store, T1: store>(a0: signer);

}
