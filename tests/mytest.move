//! account: alice, 10000000000000 0x1::STC::STC
//! account: joe
//! account: admin, 0x3db7a2da7444995338a2413b151ee437, 10000000000000 0x1::STC::STC
//! account: liquidier, 10000000000000 0x1::STC::STC
//! account: exchanger
//! account: tokenholder, 0x49156896A605F092ba1862C50a9036c9


//! new-transaction
//! sender: tokenholder
address alice = {{alice}};
script {
    //use 0x1::Debug;

    fun init_token() {
        let precision: u8 = 9; //STC precision is also 9.
        assert(precision == 9, 0)
    }
}
// check: EXECUTED