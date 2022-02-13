//! account: alice, 10000000000000 0x1::STC::STC
//! account: joe
//! account: admin, 0x0A7B8DAb322448AF454FccAfFBCbF247, 10000000000000 0x1::STC::STC
//! account: liquidier, 10000000000000 0x1::STC::STC
//! account: exchanger
//! account: tokenholder, 0x49156896A605F092ba1862C50a9036c9


//! new-transaction
//! sender: admin
address alice = {{alice}};
script {

    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Factory;

    fun init_test(account: signer) {
        Factory::init(&account);
        let len = Factory::all_pairs_length();

        assert(len == 0, 0);
       
    }
}
// check: EXECUTED



//! new-transaction
//! sender: admin
address alice = {{alice}};
script {


    use 0x1::Debug;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Factory;

    fun all_pairs_test() {
        
        let pairs = Factory::all_pairs();
        Debug::print<vector<Factory::PairsTokenCode>>(&pairs);
       
    }
}
// check: EXECUTED