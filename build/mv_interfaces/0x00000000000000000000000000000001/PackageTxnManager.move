module 0x1::PackageTxnManager {

    use 0x1::Config;
    use 0x1::Event;
    use 0x1::Option;
    use 0x1::PackageTxnManager;
    use 0x1::Version;

    struct ModuleUpgradeStrategy has store, key {
        strategy: u8,
    }
    struct TwoPhaseUpgrade has key {
        config: PackageTxnManager::TwoPhaseUpgradeConfig,
        plan: Option::Option<PackageTxnManager::UpgradePlan>,
        version_cap: Config::ModifyConfigCapability<Version::Version>,
        upgrade_event: Event::EventHandle<PackageTxnManager::UpgradeEvent>,
    }
    struct TwoPhaseUpgradeConfig has copy, drop, store {
        min_time_limit: u64,
    }
    struct TwoPhaseUpgradeV2 has key {
        config: PackageTxnManager::TwoPhaseUpgradeConfig,
        plan: Option::Option<PackageTxnManager::UpgradePlanV2>,
        version_cap: Config::ModifyConfigCapability<Version::Version>,
        upgrade_event: Event::EventHandle<PackageTxnManager::UpgradeEvent>,
    }
    struct UpgradeEvent has drop, store {
        package_address: address,
        package_hash: vector<u8>,
        version: u64,
    }
    struct UpgradePlan has copy, drop, store {
        package_hash: vector<u8>,
        active_after_time: u64,
        version: u64,
    }
    struct UpgradePlanCapability has store, key {
        account_address: address,
    }
    struct UpgradePlanV2 has copy, drop, store {
        package_hash: vector<u8>,
        active_after_time: u64,
        version: u64,
        enforced: bool,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public fun account_address(a0: &PackageTxnManager::UpgradePlanCapability): address;
    native public fun cancel_upgrade_plan(a0: &signer);
    native public fun cancel_upgrade_plan_with_cap(a0: &PackageTxnManager::UpgradePlanCapability);
    native public fun check_package_txn(a0: address, a1: vector<u8>);
    native public fun check_package_txn_v2(a0: address, a1: address, a2: vector<u8>);
    native public(script) fun convert_TwoPhaseUpgrade_to_TwoPhaseUpgradeV2(a0: signer, a1: address);
    native public fun destroy_upgrade_plan_cap(a0: PackageTxnManager::UpgradePlanCapability);
    native public fun extract_submit_upgrade_plan_cap(a0: &signer): PackageTxnManager::UpgradePlanCapability;
    native public fun get_default_min_time_limit(): u64;
    native public fun get_module_upgrade_strategy(a0: address): u8;
    native public fun get_strategy_arbitrary(): u8;
    native public fun get_strategy_freeze(): u8;
    native public fun get_strategy_new_module(): u8;
    native public fun get_strategy_two_phase(): u8;
    native public fun get_upgrade_plan(a0: address): Option::Option<PackageTxnManager::UpgradePlan>;
    native public fun get_upgrade_plan_v2(a0: address): Option::Option<PackageTxnManager::UpgradePlanV2>;
    native public fun package_txn_epilogue(a0: &signer, a1: address, a2: address, a3: bool);
    native public fun package_txn_prologue(a0: &signer, a1: address, a2: vector<u8>);
    native public fun package_txn_prologue_v2(a0: &signer, a1: address, a2: address, a3: vector<u8>);
    native public fun submit_upgrade_plan_v2(a0: &signer, a1: vector<u8>, a2: u64, a3: bool);
    native public fun submit_upgrade_plan_with_cap_v2(a0: &PackageTxnManager::UpgradePlanCapability, a1: vector<u8>, a2: u64, a3: bool);
    native public fun update_module_upgrade_strategy(a0: &signer, a1: u8, a2: Option::Option<u64>);

}
