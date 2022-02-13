// SPDX-License-Identifier: GPL-3.0

address 0x0A7B8DAb322448AF454FccAfFBCbF247 {

module Fee {

    use 0x1::Signer;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Account as LibraryAccount;

    struct Fee has key, store {
        feeOn: bool,
        feeTo: address
    }

    // initial fee info
    public fun init_fee(account: &signer) {
        let fee = Fee{feeOn: true, feeTo: LibraryAccount::fee_address()};
        move_to<Fee>(account, fee);
    }

    // update fee status
    public fun update_fee_on(account: &signer, fee_on: bool) acquires Fee {
        assert(Signer::address_of(account) == LibraryAccount::admin_address(), 0);
        let fee = borrow_global_mut<Fee>(LibraryAccount::admin_address());
        fee.feeOn = fee_on;
    }

    // update fee address
    public fun update_fee_to(account: &signer, fee_to: address) acquires Fee {
        assert(Signer::address_of(account) == LibraryAccount::admin_address(), 0);
        let fee = borrow_global_mut<Fee>(LibraryAccount::admin_address());
        fee.feeTo = fee_to;
    }

    // query fee info
    public fun get_fee(): (bool, address) acquires Fee {
        let fee = borrow_global<Fee>(LibraryAccount::admin_address());
        (*&fee.feeOn, *&fee.feeTo)
    }
    
}

}