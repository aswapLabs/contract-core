module 0x1::ModuleUpgradeScripts {

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public(script) fun cancel_upgrade_plan(a0: signer);
    native public(script) fun execute_module_upgrade_plan_propose<T0: copy+ drop+ store>(a0: signer, a1: address, a2: u64);
    native public(script) fun propose_module_upgrade_v2<T0: copy+ drop+ store>(a0: signer, a1: address, a2: vector<u8>, a3: u64, a4: u64, a5: bool);
    native public(script) fun submit_module_upgrade_plan<T0: copy+ drop+ store>(a0: signer, a1: address, a2: u64);
    native public(script) fun submit_upgrade_plan(a0: signer, a1: vector<u8>, a2: u64, a3: bool);
    native public(script) fun update_module_upgrade_strategy(a0: signer, a1: u8);

}
