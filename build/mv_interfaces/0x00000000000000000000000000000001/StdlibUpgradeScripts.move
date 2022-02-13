module 0x1::StdlibUpgradeScripts {

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun do_upgrade_from_v5_to_v6(a0: &signer);
    native public fun do_upgrade_from_v6_to_v7(a0: &signer);
    native public fun do_upgrade_from_v6_to_v7_with_language_version(a0: &signer, a1: u64);
    native public fun do_upgrade_from_v7_to_v8(a0: &signer);
    native public(script) fun take_linear_withdraw_capability(a0: signer);
    native public(script) fun upgrade_from_v2_to_v3(a0: signer, a1: u128);
    native public(script) fun upgrade_from_v5_to_v6(a0: signer);
    native public(script) fun upgrade_from_v6_to_v7(a0: signer);
    native public(script) fun upgrade_from_v7_to_v8(a0: signer);

}
