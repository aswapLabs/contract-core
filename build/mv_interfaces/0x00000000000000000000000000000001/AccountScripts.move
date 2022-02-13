module 0x1::AccountScripts {

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public(script) fun disable_auto_accept_token(a0: signer);
    native public(script) fun enable_auto_accept_token(a0: signer);

}
