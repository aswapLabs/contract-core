
//! account: admin, 0x0A7B8DAb322448AF454FccAfFBCbF247, 10000000000000 0x1::STC::STC


//! new-transaction
//! sender: admin
address admin = {{admin}};
script {

    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Token1::Token1;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Token2::Token2;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::LiquidityToken;

    fun register_liquidity_token_test(account: signer) {
        LiquidityToken::register_liquidity_token<Token1, Token2>(&account);
        let exists = LiquidityToken::liquidity_token_exists<Token1, Token2>(@admin);
        assert(exists, 0);
       
    }
}
// check: EXECUTED

//! new-transaction
//! sender: admin
address admin = {{admin}};

script {

    use 0x1::Account;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Token1::Token1;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Token2::Token2;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::LiquidityToken::{Self, LiquidityToken};

    fun mint_with_capability_test(account: signer) {
        let num: u128 = 100000000;
        let token = LiquidityToken::mint_with_capability<Token1, Token2>(@admin, num);
        Account::deposit_to_self<LiquidityToken<Token1, Token2>>(&account, token);
        let balance = Account::balance<LiquidityToken<Token1, Token2>>(@admin);
        assert(balance == num, 0);
       
    }
}
// check: EXECUTED


//! new-transaction
//! sender: admin
address admin = {{admin}};

script {

    use 0x1::Account;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Token1::Token1;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Token2::Token2;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::LiquidityToken::{Self, LiquidityToken};

    fun burn_with_capability_test(account: signer) {
        let num: u128 = 100000000;
        let token = Account::withdraw<LiquidityToken<Token1, Token2>>(&account, num);

        LiquidityToken::burn_with_capability<Token1, Token2>(@admin, token);
        let balance = Account::balance<LiquidityToken<Token1, Token2>>(@admin);
        assert(balance == 0, 0);
       
    }
}
// check: EXECUTED