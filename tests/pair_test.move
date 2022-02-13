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
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Token1::Token1;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Token2::Token2;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Pair;

    fun register_pair_test(account: signer) {
        let exists = Pair::pair_exists<Token1, Token2>();
        assert(!exists, 0);
        Pair::register_pair<Token1, Token2>(&account);
        exists = Pair::pair_exists<Token1, Token2>();
        assert(exists, 1);
    
    }
}
// check: EXECUTED


//! new-transaction
//! sender: admin
address admin = {{admin}};
script {
    use 0x1::Debug;
    use 0x1::Account;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Token1::{Self, Token1};
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Token2::{Self, Token2};
     use 0x0A7B8DAb322448AF454FccAfFBCbF247::Pair;
      use 0x0A7B8DAb322448AF454FccAfFBCbF247::Fee;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::LiquidityToken::LiquidityToken;

    fun mint_liquidity_token_test(account: signer) {
        // init
        Token1::init(&account);
        Token2::init(&account);
        
        // fee init
        Fee::init_fee(&account);

        // mint
        Token1::mint(&account, 100000000);
        Token2::mint(&account, 200000000);

        let balance1 = Account::balance<Token1>(@admin);
        let balance2 = Account::balance<Token2>(@admin);
        assert(balance1 == 100000000, 0);
        assert(balance2 == 200000000, 1);

        // withdraw
        let token1 = Account::withdraw<Token1>(&account, 100000000);
        let token2 = Account::withdraw<Token2>(&account, 200000000);


        let liquidity = Pair::mint_liquidity_token<Token1, Token2>(token1, token2);
        Account::deposit_to_self<LiquidityToken<Token1, Token2>>(&account, liquidity);
        let balance = Account::balance<LiquidityToken<Token1, Token2>>(@admin);
        Debug::print(&balance);
    
    }
}
// check: EXECUTED



//! new-transaction
//! sender: admin
address admin = {{admin}};
script {
    use 0x1::Debug;
 
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Token1::Token1;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Token2::Token2;
     use 0x0A7B8DAb322448AF454FccAfFBCbF247::Pair;

    fun get_reserves_test() {
        let (token1, token2, time) = Pair::get_reserves<Token1, Token2>();
       
        Debug::print(&token1);
        Debug::print(&token2);
        Debug::print(&time);
    
    }
}
// check: EXECUTED



//! new-transaction
//! sender: admin
address admin = {{admin}};
script {
    use 0x1::Debug;
    use 0x1::Account;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Token1::Token1;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Token2::Token2;
     use 0x0A7B8DAb322448AF454FccAfFBCbF247::Pair;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::LiquidityToken::LiquidityToken;

    fun burn_liquidity_token_test(account: signer) {
        let balance = Account::balance<LiquidityToken<Token1, Token2>>(@admin);
        let liquidity = Account::withdraw<LiquidityToken<Token1, Token2>>(&account, balance);

        let (token1, token2) = Pair::burn_liquidity_token<Token1, Token2>(liquidity);
        Account::deposit_to_self<Token1>(&account, token1);
        Account::deposit_to_self<Token2>(&account, token2);
        let balance = Account::balance<LiquidityToken<Token1, Token2>>(@admin);
        Debug::print(&balance);
    
    }
}
// check: EXECUTED



