script {

    // use 0x1::Token;
    use 0x1::Debug;
    use 0x1::Account;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::LiquidityToken::LiquidityToken;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Pair;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Token1::Token1;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Token2::Token2;

    fun main(account: signer) {
        let balance = Account::balance<LiquidityToken<Token1, Token2>>(@0x0A7B8DAb322448AF454FccAfFBCbF247);

        Debug::print(&balance);
        let liquidity_token = Account::withdraw<LiquidityToken<Token1, Token2>>(&account, balance);

        let (token1, token2) = Pair::burn_liquidity_token<Token1, Token2>(
            liquidity_token
        );

        Account::deposit_to_self<Token1>(&account, token1);
        
        let bal = Account::balance<Token1>(@0x0A7B8DAb322448AF454FccAfFBCbF247);

        Debug::print(&bal);

        Account::deposit_to_self<Token2>(&account, token2);

        let bal1 = Account::balance<Token2>(@0x0A7B8DAb322448AF454FccAfFBCbF247);

        Debug::print(&bal1);


    }
}