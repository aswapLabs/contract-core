module 0x1::NFTGalleryScripts {

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public(script) fun accept<T0: copy+ drop+ store, T1: store>(a0: signer);
    native public(script) fun transfer<T0: copy+ drop+ store, T1: store>(a0: signer, a1: u64, a2: address);

}
