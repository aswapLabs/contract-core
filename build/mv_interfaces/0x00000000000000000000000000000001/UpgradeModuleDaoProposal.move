module 0x1::UpgradeModuleDaoProposal {

    use 0x1::PackageTxnManager;

    struct UpgradeModule has copy, drop, store {
        module_address: address,
        package_hash: vector<u8>,
        version: u64,
    }
    struct UpgradeModuleCapability<T0> has key {
        cap: PackageTxnManager::UpgradePlanCapability,
    }
    struct UpgradeModuleV2 has copy, drop, store {
        module_address: address,
        package_hash: vector<u8>,
        version: u64,
        enforced: bool,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun plugin<T0: store>(a0: &signer, a1: PackageTxnManager::UpgradePlanCapability);
    native public fun propose_module_upgrade_v2<T0: copy+ drop+ store>(a0: &signer, a1: address, a2: vector<u8>, a3: u64, a4: u64, a5: bool);
    native public fun submit_module_upgrade_plan<T0: copy+ drop+ store>(a0: address, a1: u64);

}
