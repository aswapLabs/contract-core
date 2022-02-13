//! account: alice, 10000000000000 0x1::STC::STC
//! account: joe
//! account: admin, 0x0A7B8DAb322448AF454FccAfFBCbF247, 10000000000000 0x1::STC::STC
//! account: liquidier, 10000000000000 0x1::STC::STC
//! account: exchanger
//! account: tokenholder, 0x49156896A605F092ba1862C50a9036c9


//! new-transaction
//! sender: admin
address admin = {{admin}};
script {

    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Fee;

    fun init_fee_test(account: signer) {
        Fee::init_fee(&account);
        let (fee_on, fee_to) = Fee::get_fee();
        assert(fee_on, 0); 
        assert(fee_to == @admin, 1);
        
    }
}
// check: EXECUTED

//! new-transaction
//! sender: admin
address admin = {{admin}};
script {

    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Fee;

    fun update_fee_on_test(account: signer) {
        
        Fee::update_fee_on(&account, false);
        let (fee_on, fee_to) = Fee::get_fee();
        assert(!fee_on, 0); 
        assert(fee_to == @admin, 1);
       
    }
}
// check: EXECUTED



//! new-transaction
//! sender: admin
address alice = {{alice}};
script {


    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Fee;

    fun update_fee_to_test(account: signer) {
        
        Fee::update_fee_to(&account, @alice);
        let (fee_on, fee_to) = Fee::get_fee();
        assert(!fee_on, 0); 
        assert(fee_to == @alice, 1);
       
    }
}
// check: EXECUTED