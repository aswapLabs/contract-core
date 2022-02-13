module 0x1::GenesisSignerCapability {

    use 0x1::Account;
    use 0x1::Genesis;
    use 0x1::NFT;
    use 0x1::Oracle;
    use 0x1::StdlibUpgradeScripts;

    friend Genesis;
    friend NFT;
    friend Oracle;
    friend StdlibUpgradeScripts;

    struct GenesisSignerCapability has key {
        cap: Account::SignerCapability,
    }

    // NOTE: Functions are 'native' for simplicity. They may or may not be native in actuality.
    native public(friend) fun get_genesis_signer(): signer;
    native public(friend) fun initialize(a0: &signer, a1: Account::SignerCapability);

}
