//! account: alice, 10000000000000 0x1::STC::STC
//! account: joe
//! account: admin, 0x3db7a2da7444995338a2413b151ee437, 10000000000000 0x1::STC::STC
//! account: liquidier, 10000000000000 0x1::STC::STC
//! account: exchanger
//! account: tokenholder, 0x49156896A605F092ba1862C50a9036c9


//! new-transaction
//! sender: tokenholder

script {

    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Common;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Token1::Token1;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Token2::Token2;

    // Common::compare_tokens test
    // token1 < token2 
    fun compare_tokens_test() {
        let b1 = Common::compare_tokens<Token1, Token2>();

        assert(b1, 0);

        let b2 = Common::compare_tokens<Token2, Token1>();

        assert(!b2, 0);
        
    }
    
}
// check: EXECUTED